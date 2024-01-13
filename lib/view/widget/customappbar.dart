import 'package:flutter/material.dart';
import 'package:store_app/core/constant/colorsapp.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key,
      required this.searshtext,
    
      required this.iconfavoritePress,
      required this.iconsearchPress,
      required this.onChange,
      required this.mycontrooler})
      : super(key: key);
  final String searshtext;

  final void Function() iconfavoritePress;
  final void Function() iconsearchPress;
  final void Function(String) onChange;
  final TextEditingController mycontrooler;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: mycontrooler,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: iconsearchPress,
                    color: AppColors.primaryappcolor),
                hintText: searshtext,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                fillColor: Colors.grey[200],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: onChange,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 70,
            width: 60,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              icon: Icon(Icons.favorite_border_outlined,
                  size: 35, color: AppColors.primaryappcolor),
              onPressed: iconfavoritePress,
            ),
          ),
        ],
      ),
    );
  }
}
