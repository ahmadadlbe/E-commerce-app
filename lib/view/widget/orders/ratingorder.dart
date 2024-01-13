import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rating_dialog/rating_dialog.dart';
import 'package:store_app/controller/orders/archive_controller.dart';

void showdialograying(BuildContext context, String orderid) {
  showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => RatingDialog(
            initialRating: 1.0,
            // your app's name?
            title: const Text(
              'Rating Dialog',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            message: const Text(
              'Tap a star to set your rating. Add more description here if you want.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15),
            ),

            submitButtonText: 'Submit',
            commentHint: 'Set your custom comment hint',
            onCancelled: () => print('cancelled'),
            onSubmitted: (response) {
              OrderArchiveController controller = Get.find();
              controller.submintrating(
                  orderid, response.comment, response.rating.toString());
            },
          ));
}
