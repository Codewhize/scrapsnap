import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrapsnap/utils/utils.dart';
import 'package:scrapsnap/view_model/controller/addressViewController/address_view_contoller.dart';
import 'package:scrapsnap/widgets/addressRadioButtons/address_radio_button.dart';
import 'package:scrapsnap/widgets/addressTextFields/addres_pincode_text_field.dart';
import 'package:scrapsnap/widgets/addressTextFields/address_area_text_filed.dart';
import 'package:scrapsnap/widgets/addressTextFields/address_city_text_filed.dart';
import 'package:scrapsnap/widgets/addressTextFields/address_state_text_field.dart';
import 'package:scrapsnap/widgets/buttons/elevat_button_widget.dart';

import '../../widgets/addressTextFields/address_landmark_text_field.dart';
import '../../widgets/addressTextFields/address_text_field.dart';

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("address".tr),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const AddressStateTextField(),
              const AddressCityTextFiled(),
              const AddressAreaTextFiled(),
              const AddressPincodeTextFiled(),
              const AddressLandmarkTextField(),
              const AddressTextField(),
              const AddressRadioButton(),
              const SizedBox(height: 20),
              ElevatButtonWidget(
                width: 333,
                topMargin: 58,
                text: "Submit",
                onPressed: () {
                  addressViewController.addressViewOnPressed();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
