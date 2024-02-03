import 'package:flutter/material.dart';
import 'package:smarthome/constants.dart';

import 'package:smarthome/core/utils/widgets/custom_text.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem(
      {Key? key,
      required this.room,
      required this.imgPath,
      required this.screen})
      : super(key: key);

  final String room;
  final String imgPath;
  final String screen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, screen);
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                //color: whiteWithOpacity,
                borderRadius: BorderRadius.circular(24),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(
                  imgPath,
                  // height: 65,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 147,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(color: whiteWithOpacity),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: const EdgeInsets.only(bottom: 15),
              child: CustomText(
                text: room,
                isBold: true,
                fontSize: 20,
                color: Colors.black,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Column(
// children: [
// GestureDetector(
// onTap: () {
// Navigator.pushNamed(context, screen);
// },
// child: Container(
// padding: const EdgeInsets.all(16),
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(20),
//
// ),
// child: Column(
// children: [
// Image.asset(
// imgPath,
// width: 40,
// height: 40,
// ),
// const SizedBox(
// height: 15,
// ),
// CustomText(
// text: room,
// isBold: true,
// fontSize: 16,
// ),
// ],
// ),
// ),
// ),
// ],
// );
