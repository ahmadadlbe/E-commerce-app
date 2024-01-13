import 'package:flutter/material.dart';
import 'package:store_app/data/model/address_model.dart';

class CustomCardAddress extends StatelessWidget {
  const CustomCardAddress(
      {super.key, required this.addressModel, required this.onPressedicon});
  final AddressModel addressModel;
  final void Function()? onPressedicon;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(addressModel.addressName!),
        subtitle: Text(addressModel.addressCity!),
        trailing: IconButton(
            onPressed: onPressedicon, icon: const Icon(Icons.delete)),
      ),
    );
  }
}
