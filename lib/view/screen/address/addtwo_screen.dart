import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/address/addadresstwo_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/core/shared/custombuttom.dart';
import 'package:store_app/view/widget/authwidget/customtextfromfild.dart';

class AddAddressTwoScreen extends StatelessWidget {
  const AddAddressTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAddressTwoController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Address'),
        ),
        body: GetBuilder<AddAddressTwoController>(
            builder: (controller) => HandlingReqwestData(
                  statusRequest: controller.statusRequest,
                  widget: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextFromFildAuth(
                          textlabel: "city",
                          texthint: "add city",
                          iconsuffix: const Icon(Icons.location_city),
                          mycontroller: controller.city,
                          valid: (val) {
                            return null;
                          },
                          isnumber: false),
                      CustomTextFromFildAuth(
                          textlabel: "street",
                          texthint: "add street",
                          iconsuffix: const Icon(Icons.streetview),
                          mycontroller: controller.street,
                          valid: (val) {
                            return null;
                          },
                          isnumber: false),
                      CustomTextFromFildAuth(
                          textlabel: "name",
                          texthint: "add name",
                          iconsuffix: const Icon(Icons.abc_outlined),
                          mycontroller: controller.name,
                          valid: (val) {
                            return null;
                          },
                          isnumber: false),
                      CustomButton(
                          textbutton: "Add",
                          onpress: () {
                            controller.addaddress();
                          }),
                    ],
                  ),
                )));
  }
}
