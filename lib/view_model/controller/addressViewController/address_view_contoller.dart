import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddressViewContoller extends GetxController {
  final stateTextFieldController = TextEditingController().obs;
  final cityTextFieldController = TextEditingController().obs;
  RxString selectCity = ''.obs;
  RxString selectState = ''.obs;
  RxList<String> stateList = ["GUJARAT", "DELHI"].obs;
  RxList<String> cityList = <String>[].obs;

  final RxMap<String, List<String>> cityMap = {
    "GUJARAT": ["AHMEDABAD", "SURAT"],
    "DELHI": ["DELHI", "NOIDA"],
  }.obs;

  @override
  void onInit() {
    super.onInit();
    loadSelectedStateCity();
  }

  String capitalize(String s) {
    if (s.isEmpty) return s;
    return s.toUpperCase();
  }

  loadSelectedStateCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedState = prefs.getString('state');
    String? savedCity = prefs.getString('city');

    if (savedState != null && stateList.contains(savedState)) {
      selectState.value = savedState;
      stateTextFieldController.value.text = savedState;
      loadCitiesForState(savedState);

      if (savedCity != null && cityList.contains(savedCity)) {
        selectCity.value = savedCity;
        cityTextFieldController.value.text = savedCity;
      }
    }
  }

  void loadCitiesForState(String state) {
    cityList.value = cityMap[state] ?? [];
    selectCity.value = '';
    cityTextFieldController.value.clear();
  }

  saveSelectedStateCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('state', selectState.value);
    await prefs.setString('city', selectCity.value);
  }

  void onStateChanged(String? newState) {
    if (newState != null) {
      selectState.value = newState;
      stateTextFieldController.value.text = newState;
      loadCitiesForState(newState);
    }
  }

  void onCityChanged(String? newCity) {
    if (newCity != null) {
      selectCity.value = newCity;
      cityTextFieldController.value.text = newCity;
    }
  }

  void submitSelection() async {
    String enteredState = stateTextFieldController.value.text.trim();
    String enteredCity = cityTextFieldController.value.text.trim();

    // Capitalize state and city names
    String upperCaseState = capitalize(enteredState);
    String upperCaseCity = capitalize(enteredCity);

    // Check and add new state if not in the list
    if (upperCaseState.isNotEmpty && !stateList.contains(upperCaseState)) {
      stateList.add(upperCaseState);
    }

    // Check if a state and city are selected or entered
    if (selectState.isNotEmpty && upperCaseCity.isNotEmpty) {
      if (!cityList.contains(upperCaseCity)) {
        cityList.add(upperCaseCity);
      }
      selectCity.value = upperCaseCity;

      // Save the selected state and city
      await saveSelectedStateCity();

      // Navigate to the next page
      // Get.to(NextPage());
    } else {
      Get.snackbar("Error", "Please select both a state and a city.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Widget selectStateIconButton() {
    return DropdownButton(
      value: stateList,
      items: stateList.map((String value) {
        return DropdownMenuItem(child: Text(value));
      }).toList(),
      onChanged: (value) {
        stateTextFieldController.value.text = value.toString();
      },
    );
  }
}
