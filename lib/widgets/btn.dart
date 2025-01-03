import 'package:flutter/material.dart';
import 'package:insuline_admin/res/color/app_colors.dart';


class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback? ontap;
  const CustomButton({super.key, required this.title, this.ontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: AppColors.greenColor, borderRadius: BorderRadius.circular(30)),
        child: Center(
            child: Text(
          title,
          style: TextStyle( color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
    );
  }
}
