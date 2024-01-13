import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomCardChoseAddressCheckout extends StatelessWidget {
  const CustomCardChoseAddressCheckout(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.isactiv,
      required this.onTap});
  final String title;
  final String subtitle;
  final bool isactiv;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        color: isactiv == true ? AppColors.secndryappcolor : null,
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
        ),
      ),
    );
  }
}
