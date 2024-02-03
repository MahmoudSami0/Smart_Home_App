
import 'package:flutter/material.dart';

import '../../constants.dart';

void showSnackBar(BuildContext context,String message) {
  ScaffoldMessenger.of(context).showSnackBar( SnackBar(

    backgroundColor:kColor,
    closeIconColor: Colors.red,

    content: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const Icon(Icons.error,color: Colors.red,),
        Text(
          message,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
      ],
    ),
  ));
}