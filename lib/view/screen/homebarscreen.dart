import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/homeBarscreen_controller.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/functions/alertexit.dart';
import 'package:store_app/core/services/service.dart';
import 'package:store_app/view/widget/home/customhomebar.dart';

class HomeBarScreen extends StatelessWidget {
  HomeBarScreen({super.key});
  final MyService myService = Get.find();
  @override
  Widget build(BuildContext context) {
    Get.put(HomeBarScreenControllerImp());
    return GetBuilder<HomeBarScreenControllerImp>(
        builder: (controller) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(AppRoutes.cartrouts);
                },
                child: const Icon(Icons.shopping_basket),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: const CustomBarHome(),
              body: WillPopScope(
                onWillPop: alertexit,
                child: SafeArea(
                    child:
                        controller.pagelist.elementAt(controller.pagenumber)),
              ),
            ));
  }
}
