import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/controller/authcontroller/succsesresetpassword_controller.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/constant/image_constant.dart';
import 'package:store_app/view/widget/authwidget/custombutton.dart';

import 'package:store_app/view/widget/authwidget/customtextpage.dart';

class SuccessSignUpScreen extends StatelessWidget {
  const SuccessSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessresetpasswordControllerImp controller =
        Get.put(SuccessresetpasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "32".tr,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryappcolor,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Lottie.asset(
              AppImages.kimageSuccess,
              width: 200,
              height: 200,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomContainerTextAuth(titletext: "38".tr, bodytext: " "),
            const SizedBox(
              height: 30,
            ),
            CustomButtonAuth(
              textbutton: "31".tr,
              onpress: () {
                controller.gotologin();
              },
            ),
          ],
        ),
      ),
    );
  }
}
