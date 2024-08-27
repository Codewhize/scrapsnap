import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressViewContoller extends GetxController {
  final stateTextFieldController = TextEditingController().obs;
  final cityTextFieldController = TextEditingController().obs;
  final areaTextFieldController = TextEditingController().obs;
  final pincodeTextFieldController = TextEditingController().obs;
  final landmarkTextFieldController = TextEditingController().obs;
  final addressTextFieldController = TextEditingController().obs;
  RxList<String> stateList = ["GUJARAT", "DELHI"].obs;
  RxList<String> cityList = <String>[].obs;
  RxList<String> areaList = <String>[].obs;

  final String counrtyKey = 'country';

  final RxMap<String, List<String>> cityMap = {
    "GUJARAT": ["AHMEDABAD", "SURAT"],
    "DELHI": ["DELHI", "NOIDA"],
  }.obs;

  final RxMap<String, List<String>> areaMap = {
    "AHMEDABAD": ["MANINAGAR", "BOPAL"],
    "SURAT": ["KOSAD", "KATARGAM"],
    "DELHI": ["KAROL BAGH", "LAJPAT NAGAR"],
    "NOIDA": ["SECTION 15", "SECTION 18"],
  }.obs;

  @override
  void onInit() {
    super.onInit();
    loadStateData();
  }

  String capitalize(String s) {
    if (s.isEmpty) return s;
    return s.toUpperCase();
  }

  Future<void> savedStateData(String stateName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    stateName = capitalize(stateName);
    if (stateName.isNotEmpty && !stateList.contains(stateName)) {
      stateList.add(stateName);
      String jsonCountry = jsonEncode(stateList);
      await pref.setString(counrtyKey, jsonCountry);
      stateList.refresh();
    }
  }

  Future<void> savedCityData(String cityNamed) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String stateName = stateTextFieldController.value.text.toUpperCase();
    String cityName = capitalize(cityNamed);

    if (cityMap.containsKey(stateName)) {
      if (!cityMap[stateName]!.contains(cityName)) {
        cityMap[stateName]!.add(cityName);
        List<String>? cityData = cityMap[stateName];
        await pref.setStringList(stateName, cityData!);

        cityMap.refresh();
      }
    } else {
      cityMap[stateName] = [cityName];
      await pref.setStringList(stateName, cityMap[stateName]!);
      cityMap.refresh();
    }
  }

  Future<void> savedAreaData(String areaName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String cityName = cityTextFieldController.value.text.toString();
    areaName = capitalize(areaName);
    cityName = capitalize(cityName);
    if (areaMap.containsKey(cityName)) {
      if (!areaMap[cityName]!.contains(areaName)) {
        areaMap[cityName]!.add(areaName);
        await pref.setStringList(cityName, areaMap[cityName]!);
        areaMap.refresh();
      }
    } else {
      areaMap[cityName] = [areaName];
      await pref.setStringList(cityName, areaMap[cityName]!);
      areaMap.refresh();
    }
  }

  void onChangedState(value) {
    stateTextFieldController.value.text = value.toString();
    loadCityData(value.toString());
  }

  void onChangedCity(value) {
    cityTextFieldController.value.text = value.toString();
    loadAreaData(cityTextFieldController.value.text);
  }

  void onChangeArea(value) {
    areaTextFieldController.value.text = value!;
  }

  void addressViewOnPressed() {
    if (stateTextFieldController.value.text.isNotEmpty &&
        cityTextFieldController.value.text.isNotEmpty &&
        areaTextFieldController.value.text.isNotEmpty &&
        pincodeTextFieldController.value.text.isNotEmpty &&
        addressTextFieldController.value.text.isNotEmpty) {
      savedStateData(stateTextFieldController.value.text);
      savedCityData(cityTextFieldController.value.text.toString());
      savedAreaData(areaTextFieldController.value.text.toString());
    } else {
      Utils.snackbar("Error", "Fill all details");
    }
  }

  void loadCityData(String stateName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();

    List<String>? cities = pref.getStringList(stateName);
    if (cities != null) {
      cityList.value = cities;
    } else {
      cityList.value = cityMap[stateName]!;
    }
  }

  void loadStateData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? jsonString = pref.getString(counrtyKey);
    // pref.clear();

    if (jsonString != null) {
      List<dynamic> jsonList = jsonDecode(jsonString);

      stateList.value = jsonList.cast<String>();
    }
  }

  void loadAreaData(String cityName) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? areas = pref.getStringList(cityName);
    if (areas != null) {
      areaList.value = areas.cast<String>();
    } else {
      areaList.value = areaMap[cityName]!;
    }
  }
}
