import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/authcontroller/verifycode_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/view/widget/authwidget/custombutton.dart';
import 'package:store_app/view/widget/authwidget/customtextpage.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryappcolor,
        elevation: 0.0,
      ),
      body: GetBuilder<VerifyCodeControllerImp>(
        builder: (controller) => HandlingReqwestData(
          statusRequest: controller.statusRequest,
          widget: Padding(
            padding: const EdgeInsets.all(20),
            child: ListView(
              children: [
                CustomContainerTextAuth(titletext: "", bodytext: "27".tr),
                const SizedBox(
                  height: 30,
                ),
                OtpTextField(
                  numberOfFields: 5,
                  borderColor: AppColors.primaryappcolor,
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode) {
                    controller.checkcode(verificationCode);
                  }, // end onSubmit
                ),
                const SizedBox(
                  height: 60,
                ),
                CustomButtonAuth(
                  textbutton: "8".tr,
                  onpress: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
