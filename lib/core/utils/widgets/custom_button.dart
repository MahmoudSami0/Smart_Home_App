import 'package:flutter/material.dart';

import '../../../constants.dart';




class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap,this.isLoading = false, required this.btnText, this.height = 60, this.color = kColor, this.width});


  final void Function()? onTap;
  final String btnText;
  final bool isLoading;
  final double height;
  final Color color;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          // gradient: const LinearGradient(colors: [
          //   Color.fromRGBO(143, 148, 251, 1),
          //   Color.fromRGBO(143, 148, 251, .6),
          // ])
        ),
        child: Center(
          child: isLoading
              ? const SizedBox(
                  height: 24,
                  width: 24,
                  child: CircularProgressIndicator(),
                )
              : Text(
                  btnText,
                  style: const  TextStyle(
                      color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
