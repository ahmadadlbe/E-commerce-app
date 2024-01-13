import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/homeBarscreen_controller.dart';
import 'package:store_app/view/widget/home/customButtonBar.dart';

class CustomBarHome extends StatelessWidget {
  const CustomBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeBarScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(children: [
              ...List.generate(controller.pagelist.length + 1, (index) {
                int i = index > 2 ? index - 1 : index;
                return index == 2
                    ? const Spacer(
                        flex: 1,
                      )
                    : CustomButtonBar(
                        isactiv: controller.pagenumber == i ? true : false,
                        iconbar: controller.buttonbar[i]['icon'],
                        // textbar: controller.buttonbar[i]['title'],
                        onPressed: () {
                          controller.changepage(i);
                        });
              })
            ])));
  }
}
