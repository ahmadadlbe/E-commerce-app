import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCardCart extends StatelessWidget {
  const CustomCardCart(
      {super.key,
      required this.itemname,
      required this.price,
      required this.count,
      required this.imagepath,
      required this.onAdd,
      required this.onRemove});
  final String? itemname;
  final String? imagepath;
  final String? price;
  final String? count;
  final void Function()? onAdd;
  final void Function()? onRemove;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1),
      child: Column(
        children: [
          Card(
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
                      subtitle: Text("$price \$"),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 35,
                          child: IconButton(
                              onPressed: onAdd, icon: const Icon(Icons.add)),
                        ),
                        SizedBox(
                          height: 20,
                          child: Text(
                            "$count",
                            style: const TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                          child: IconButton(
                              onPressed: onRemove,
                              icon: const Icon(Icons.remove)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
