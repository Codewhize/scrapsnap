import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/res/appColors/app_colors.dart';
import 'package:scrapsnap/view_model/controller/addressViewController/address_view_contoller.dart';
import 'package:scrapsnap/widgets/addressTextFields/address_city_text_filed.dart';
import 'package:scrapsnap/widgets/addressTextFields/address_state_text_field.dart';

class AddressView extends StatefulWidget {
  const AddressView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddressViewState createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  final addressViewController = Get.put(AddressViewContoller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("address".tr),
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_ios_outlined)),
      ),
      body: Center(
        child: Column(
          children: [
            const AddressStateTextField(),
            const AddressCityTextFiled(),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: addressViewController.submitSelection,
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}
