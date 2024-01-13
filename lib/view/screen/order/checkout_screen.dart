import 'package:flutter/material.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/orders/checkout_controller.dart';
import 'package:store_app/core/class/handlingdata.dart';
import 'package:store_app/core/constant/colorsapp.dart';
import 'package:store_app/core/constant/image_constant.dart';
import 'package:store_app/core/shared/custombuttom.dart';
import 'package:store_app/view/widget/checkout.dart/cardchoseaddress.dart';
import 'package:store_app/view/widget/checkout.dart/carddelivry_method.dart';
import 'package:store_app/view/widget/checkout.dart/payment_method.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CheckoutController checkoutController = Get.put(CheckoutController());
    return Scaffold(
        bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: CustomButton(
                textbutton: "CheckOut",
                onpress: () {
                  checkoutController.checkoutorder();
                })),
        appBar: AppBar(
          title: const Text('Check Out'),
        ),
        body: GetBuilder<CheckoutController>(
          builder: (controller) => HandlingVeiwData(
            statusRequest: controller.statusRequest,
            widget: RefreshIndicator(
              onRefresh: () => controller.refreshindicators(),
              child: Container(
                margin: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Text("Chose Payment Method",
                        style: TextStyle(color: AppColors.primaryappcolor)),
                    CustomPymantCardCheckout(
                      onTap: () {
                        controller.chosepaymentmethod("0");
                      },
                      title: "Cash",
                      isactiv: controller.payment == "0" ? true : false,
                    ),
                    CustomPymantCardCheckout(
                      onTap: () async {
                        controller.chosepaymentmethod("1");
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => PaypalCheckout(
                            sandboxMode: true,
                            clientId:
                                "AVzPPv-qWYjxHoCVxI3dedEUs4nidctc3eJZ6g0qYtlSaqyNwpEv5o8ImmAGxUgdHnfLNSgQ1cpGVC5X",
                            secretKey:
                                "EBOvBYibygd4-AM7gl_ZlieHiekIbkUF6ZOquRt3l50-tliAIaWK-2SSrNHLmLd1qABvujGJO4JDBGYW",
                            returnURL: "success.snippetcoder.com",
                            cancelURL: "cancel.snippetcoder.com",
                            transactions: [
                              {
                                "amount": {
                                  "total": '${controller.totalprice}',
                                  "currency": "USD",
                                  "details": {
                                    "subtotal": '${controller.totalprice}',
                                    "shipping": '0',
                                    "shipping_discount": 0
                                  }
                                },
                                "description":
                                    "The payment transaction description.",
                                // "payment_options": {
                                //   "allowed_payment_method":
                                //       "INSTANT_FUNDING_SOURCE"
                                // },
                                // "item_list": {
                                //   "items": [
                                //     {
                                //       "name": "Apple",
                                //       "quantity": 4,
                                //       "price": '5',
                                //       "currency": "USD"
                                //     },
                                //     {
                                //       "name": "Pineapple",
                                //       "quantity": 5,
                                //       "price": '10',
                                //       "currency": "USD"
                                //     }
                                //   ],

                                // shipping address is not required though
                                //   "shipping_address": {
                                //     "recipient_name": "Raman Singh",
                                //     "line1": "Delhi",
                                //     "line2": "",
                                //     "city": "Delhi",
                                //     "country_code": "IN",
                                //     "postal_code": "11001",
                                //     "phone": "+00000000",
                                //     "state": "Texas"
                                //  },
                                // }
                              }
                            ],
                            note: "Contact us for any questions on your order.",
                            onSuccess: (Map params) async {
                              Get.snackbar(
                                  "success", "the pay method is success");
                            },
                            onError: (error) {
                              Get.defaultDialog(
                                  middleText: "Try Agin", title: "Erorr");
                            },
                            onCancel: () {
                              print('cancelled:');
                            },
                          ),
                        ));
                      },
                      title: "Paymant Cridet",
                      isactiv: controller.payment == "1" ? true : false,
                    ),
                    Text(
                      "Chose Dylivre Type",
                      style: TextStyle(color: AppColors.primaryappcolor),
                    ),
                    Row(
                      children: [
                        CustomCardDilevryCheckout(
                          onTap: () {
                            controller.chosedeliverytype("0");
                          },
                          image: AppImages.kimagethree,
                          title: "Delivery",
                          isactiv:
                              controller.deliverytype == "0" ? true : false,
                        ),
                        CustomCardDilevryCheckout(
                          onTap: () {
                            controller.chosedeliverytype("1");
                          },
                          image: AppImages.kimagethree,
                          title: "In Store",
                          isactiv:
                              controller.deliverytype == "1" ? true : false,
                        ),
                      ],
                    ),
                    if (controller.deliverytype == "0")
                      Column(
                        children: [
                          Text("Shipping Address",
                              style:
                                  TextStyle(color: AppColors.primaryappcolor)),
                          ...List.generate(
                            controller.dataaddress.length,
                            (index) => CustomCardChoseAddressCheckout(
                                onTap: () {
                                  controller.choseaddressdelivery(
                                      "${controller.dataaddress[index].addressId}");
                                },
                                title:
                                    "${controller.dataaddress[index].addressName}",
                                subtitle:
                                    "${controller.dataaddress[index].addressCity} - ${controller.dataaddress[index].addressStreet}",
                                isactiv:
                                    controller.dataaddress[index].addressId ==
                                            controller.addressid
                                        ? true
                                        : false),
                          )
                        ],
                      )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
