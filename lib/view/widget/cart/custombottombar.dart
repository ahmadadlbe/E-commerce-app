import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/cart_controller.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar(
      {super.key,
      required this.price,
      required this.pricemid,
      required this.totalprice,
      required this.couponcontroller,
      required this.onPresapply,
      required this.onpressorder});
  final String? price;
  final String? pricemid;
  final String? totalprice;
  final TextEditingController? couponcontroller;
  final void Function()? onPresapply;
  final void Function()? onpressorder;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GetBuilder<CartControllerImp>(
          builder: (controller) => controller.couponname == null
              ? Container(
                  padding:
                      const EdgeInsets.only(bottom: 20, left: 10, right: 10),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: TextFormField(
                            controller: couponcontroller,
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 15),
                                hintText: "Insert Code Coupon",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          )),
                      Expanded(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.primaryappcolor),
                            child: MaterialButton(
                                onPressed: onPresapply,
                                child: Text(
                                  "apply",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: AppColors.whiteappcolor),
                                )),
                          ))
                    ],
                  ),
                )
              : Container(
                  child: Text(
                    controller.couponname!,
                    style: TextStyle(color: AppColors.secndryappcolor),
                  ),
                ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          height: Get.width / 2.2,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.secndryappcolor, width: 2)),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: const Text("price"),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Text("$price"),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: const Text("Discount"),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("$pricemid"),
                  )
                ],
              ),
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: const Divider(
                    thickness: 4,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Text("Totale Price"),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text("$totalprice"),
                  )
                ],
              ),
            ],
          ),
        ),
        MaterialButton(
          onPressed: onpressorder,
          child: Container(
            color: AppColors.primaryappcolor,
            margin: const EdgeInsets.symmetric(vertical: 10),
            alignment: Alignment.center,
            width: 220,
            height: 50,
            child: Text(
              "Order",
              style: TextStyle(color: AppColors.whiteappcolor, fontSize: 20),
            ),
          ),
        )
      ],
    );
  }
}
