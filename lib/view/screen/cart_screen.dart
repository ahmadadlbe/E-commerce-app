import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/core/constant/links.dart';
import 'package:store_app/view/widget/cart/custombottombar.dart';
import 'package:store_app/view/widget/cart/customcardcart.dart';
import 'package:store_app/view/widget/cart/customtopcartpage.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("My Cart"),
          ),
          bottomNavigationBar: CustomBottomBar(
              onpressorder: () {
                controller.gotochechout();
              },
              onPresapply: () {
                controller.couponcheck();
              },
              couponcontroller: controller.couponcontroller,
              price: "${controller.price}",
              pricemid: "${controller.discount}",
              totalprice: "${controller.totalprice}"),
          body: HandlingReqwestData(
            statusRequest: controller.statusRequest,
            widget: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: ListView(
                  children: [
                    CustomTopCart(count: "${controller.counttotal}"),
                    ...List.generate(
                      controller.data.length,
                      (index) => CustomCardCart(
                          onAdd: () async {
                            await controller
                                .cartadd(controller.data[index].itemsId);
                            controller.refreshpage();
                          },
                          onRemove: () async {
                            await controller
                                .cartremov(controller.data[index].itemsId);
                            controller.refreshpage();
                          },
                          imagepath:
                              "${AppLink.itemsimage}/${controller.data[index].itemsImage}",
                          itemname: "${controller.data[index].itemsName}",
                          price: "${controller.data[index].itemspriceDiscuont}",
                          count: "${controller.data[index].countitem}"),
                    )
                  ],
                )),
          ));
    });
  }
}
