
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/widgets/custom_text.dart';


class GarageItem extends StatelessWidget {
  const GarageItem(
      {Key? key,
        required this.deviceName,
        required this.iconPath,
        required this.powerOn,
        this.onChanged})
      : super(key: key);

  final String deviceName;
  final String iconPath;
  final bool powerOn;
  final Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: !powerOn ? whiteWithOpacity : blackWithOpacity,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Icon
              Image.asset(
                iconPath,
                height: 65,
                color: !powerOn ? Colors.black : Colors.white,
              ),
              // Device Name And power
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Device Name

                    Expanded(
                      child: CustomText(
                        text: deviceName,
                        color: !powerOn ? tColor : offColor,
                      ),
                    ),
                    // Power On/Off
                    Transform.rotate(
                      angle: pi / 2,
                      child: CupertinoSwitch(
                        value: powerOn,
                        onChanged: onChanged,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
