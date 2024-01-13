import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/settings_controller.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/constant/image_constant.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SettingsControllerImp());
    return Scaffold(
      body: Container(
        child: ListView(children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(
                color: AppColors.secndryappcolor,
                height: Get.width / 2.5,
              ),
              Positioned(
                top: Get.width / 4.2,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      color: AppColors.whiteappcolor,
                      borderRadius: BorderRadius.circular(100)),
                  child: CircleAvatar(
                    radius: 80,
                    child: Image.asset(
                      fit: BoxFit.cover,
                      AppImages.atarimage,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          GetBuilder<SettingsControllerImp>(
            builder: (controller) => Card(
              child: Column(
                children: [
                  ...List.generate(
                      controller.titleandicon.length,
                      (index) => ListTile(
                            title:
                                Text(controller.titleandicon[index]['title']),
                            trailing: controller.titleandicon[index]['icon'],
                            onTap: controller.titleandicon[index]['onpress'],
                          ))
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
