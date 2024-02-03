import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton(
      {Key? key, required this.imgUrl, required this.text,required  this.onTab})
      : super(key: key);

  final String imgUrl, text;
  final VoidCallback? onTab;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTab,
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black26)),
        child: Container(
          padding: const EdgeInsets.all(16),
          height: 50,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 1,
              ),
              Image.asset(imgUrl),
              const Spacer(
                flex: 2,
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const Spacer(
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
