import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomTextFromFildAuth extends StatelessWidget {
  const CustomTextFromFildAuth(
      {super.key,
      required this.textlabel,
      required this.texthint,
      required this.iconsuffix,
      required this.mycontroller,
      required this.valid,
      required this.isnumber,
      this.obscureText,
      this.onTapicon});
  final String? textlabel;
  final String? texthint;
  final Icon? iconsuffix;
  final bool? isnumber;
  final bool? obscureText;
  final void Function()? onTapicon;

  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        obscureText: obscureText == null || obscureText == false ? false : true,
        keyboardType: isnumber == true
            ? TextInputType.visiblePassword
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
          hintText: texthint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          label: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(textlabel!),
          ),
          suffixIcon: InkWell(
            onTap: onTapicon,
            child: iconsuffix,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: AppColors.primaryappcolor,
              width: 2.3,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color: AppColors.primaryappcolor,
            ),
          ),
        ),
      ),
    );
  }
}
