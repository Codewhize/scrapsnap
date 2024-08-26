import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateCitySelectionController extends GetxController {
  var stateController = TextEditingController().obs;
  var cityController = TextEditingController().obs;

  var states = <String>["Gujarat", "Maharashtra", "Rajasthan"].obs;
  var selectedState = ''.obs;
  var cities = <String>[].obs;
  var selectedCity = ''.obs;

  final Map<String, List<String>> stateCityMap = {
    "Gujarat": ["Ahmedabad", "Surat", "Vadodara"],
    "Maharashtra": ["Mumbai", "Pune", "Nagpur"],
    "Rajasthan": ["Jaipur", "Udaipur", "Jodhpur"],
  };

  @override
  void onInit() {
    super.onInit();
    _loadSelectedStateCity();
  }

  // Helper function to capitalize the first letter of each word
  String capitalize(String s) {
    return s.toUpperCase();
  }

  // Load saved state and city from SharedPreferences
  _loadSelectedStateCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedState = prefs.getString('selected_state');
    String? savedCity = prefs.getString('selected_city');

    if (savedState != null && states.contains(savedState)) {
      selectedState.value = savedState;
      stateController.value.text = savedState;
      _loadCitiesForState(savedState);

      if (savedCity != null && cities.contains(savedCity)) {
        selectedCity.value = savedCity;
        cityController.value.text = savedCity;
      }
    }
  }

  // Save the selected state and city to SharedPreferences
  _saveSelectedStateCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selected_state', selectedState.value);
    await prefs.setString('selected_city', selectedCity.value);
  }

  void _loadCitiesForState(String state) {
    cities.value = stateCityMap[state] ?? [];
    selectedCity.value = ''; // Reset city selection if state changes
    cityController.value.clear();
  }

  void onStateChanged(String? newState) {
    if (newState != null) {
      selectedState.value = newState;
      stateController.value.text = newState;
      _loadCitiesForState(newState);
    }
  }

  void onCityChanged(String? newCity) {
    if (newCity != null) {
      selectedCity.value = newCity;
      cityController.value.text = newCity;
    }
  }

  void submitSelection() {
    String enteredCity = cityController.value.text.trim();
    if (selectedState.isNotEmpty && enteredCity.isNotEmpty) {
      // Capitalize and save the entered city
      String capitalizedCity = capitalize(enteredCity);
      if (!cities.contains(capitalizedCity)) {
        cities.add(capitalizedCity);
      }
      selectedCity.value = capitalizedCity;
      _saveSelectedStateCity(); // Save the selected state and city
      Get.to(NextPage());
    } else {
      Get.snackbar("Error", "Please select both a state and a city.",
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}

class StateCitySelectionPage extends StatelessWidget {
  final StateCitySelectionController controller =
      Get.put(StateCitySelectionController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select State and City")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Obx(() => TextField(
                  controller: controller.stateController.value,
                  decoration: InputDecoration(
                    labelText: "Select State",
                    suffixIcon: DropdownButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      value: controller.selectedState.isNotEmpty
                          ? controller.selectedState.value
                          : null,
                      hint: const Text("Select State"),
                      items: controller.states.map((String state) {
                        return DropdownMenuItem<String>(
                          value: state,
                          child: Text(controller
                              .capitalize(state)), // Capitalize state name
                        );
                      }).toList(),
                      onChanged: controller.onStateChanged,
                    ),
                  ),
                )),
            const SizedBox(height: 20),
            Obx(() => TextField(
                  controller: controller.cityController.value,
                  decoration: InputDecoration(
                    labelText: "Select or Enter City",
                    suffixIcon: DropdownButton<String>(
                      icon: const Icon(Icons.arrow_drop_down),
                      value: controller.selectedCity.isNotEmpty
                          ? controller.selectedCity.value
                          : null,
                      hint: const Text("Select City"),
                      items: controller.cities.map((String city) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: Text(controller
                              .capitalize(city)), // Capitalize city name
                        );
                      }).toList(),
                      onChanged: controller.onCityChanged,
                    ),
                  ),
                )),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.submitSelection,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Next Page")),
      body: const Center(child: Text("You have successfully submitted!")),
    );
  }
}
