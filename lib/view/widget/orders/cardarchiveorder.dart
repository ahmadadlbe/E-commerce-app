import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:store_app/controller/orders/archive_controller.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/constant/routesname.dart';
import 'package:store_app/core/shared/custombuttom.dart';
import 'package:store_app/data/model/orders_model.dart';
import 'package:store_app/view/widget/orders/ratingorder.dart';

class CustomArchiveCardOrders extends GetView<OrderArchiveController> {
  const CustomArchiveCardOrders({super.key, required this.ordersModel});
  final OrdersModel ordersModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Jiffy(ordersModel.ordersDatetime, "yyyy-MM-dd").yMMMEd,
              style: TextStyle(color: AppColors.primaryappcolor),
            ),
            Row(
              children: [
                Text(
                  "Order Number : #${ordersModel.ordersId}",
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  width: 15,
                ),
                // Text(
                //   Jiffy(ordersModel.ordersDatetime!, "yyyy-MM-dd").fromNow(),
                //   style: TextStyle(color: AppColors.primaryappcolor),
                // )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                "Order Type :  ${controller.printordertype(ordersModel.ordersType!)} "),
            Text("Order Price : ${ordersModel.ordersTotalprice}"),
            Text("Dilevry Price : ${ordersModel.ordersPricedelivery} "),
            Text(
                "Payment Method : ${controller.printpaymentMethod(ordersModel.ordersPaymentmethod!)} "),
            Text(
                "Order Status : ${controller.printordeStatus(ordersModel.ordersStatus!)}"),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Divider(thickness: 2.5)),
            Text(
              "Totale Price : ${ordersModel.ordersTotalprice} ",
              style: TextStyle(color: AppColors.primaryappcolor),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: CustomButton(
                    textbutton: "Detiels",
                    onpress: () {
                      Get.toNamed(AppRoutes.orderdetails,
                          arguments: {"ordersModel": ordersModel});
                    },
                  ),
                ),
                if (ordersModel.ordersRating == "0")
                  Container(
                    width: 100,
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: CustomButton(
                      textbutton: "rating",
                      onpress: () {
                        showdialograying(context, ordersModel.ordersId!);
                      },
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
