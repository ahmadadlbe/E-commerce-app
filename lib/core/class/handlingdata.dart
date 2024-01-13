import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store_app/core/class/statusreqwest.dart';
import 'package:store_app/core/constant/image_constant.dart';

class HandlingVeiwData extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingVeiwData(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
              AppImages.kimageLoading,
              width: 200,
              height: 200,
            ),
          )
        : statusRequest == StatusRequest.offlinefailur
            ? Center(
                child: Lottie.asset(
                  AppImages.kimageNoInternet,
                  width: 200,
                  height: 200,
                ),
              )
            : statusRequest == StatusRequest.serverfailur
                ? Center(
                    child: Lottie.asset(
                      AppImages.kimageErorr404,
                      width: 200,
                      height: 200,
                    ),
                  )
                : widget;
  }
}

class HandlingReqwestData extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingReqwestData(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
              AppImages.kimageLoading,
              width: 200,
              height: 200,
            ),
          )
        : statusRequest == StatusRequest.offlinefailur
            ? Center(
                child: Lottie.asset(
                  AppImages.kimageNoInternet,
                  width: 200,
                  height: 200,
                ),
              )
            : widget;
  }
}
