import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_app/controller/homepage_controller.dart';

class CustomListSearch extends GetView<HomePageControllerImp> {
  const CustomListSearch(
      {required this.itemname,
      required this.imagepath,
      required this.onTap,
      super.key});
  final String? itemname;
  final String? imagepath;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Card(
            child: Container(
              child: Row(
                children: [
                  Expanded(
                      flex: 1, child: CachedNetworkImage(imageUrl: imagepath!)),
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text(
                        "$itemname",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
