import 'package:flutter/material.dart';

import 'package:smarthome/features/settings/view/widgets/wifi_list_vew.dart';

class WifiScanBody extends StatelessWidget {
  const WifiScanBody({Key? key}) : super(key: key);

  static const String id = "WifiScanBody";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Scan Wifi ",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 30,
            )),
      ),
      body: const WifiListViewBuilder(),
    );
  }
}

// Expanded(
//   flex: ,
//   child: Container(
//     decoration: BoxDecoration(
//       color: Colors.white
//     ),
//     padding:  EdgeInsets.all(24),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const CustomText(text: "ssidName" ,isBold: true,fontSize: 18,),
//         const SizedBox(
//           height: 10,
//         ),
//         CustomTextField(hintText: "Wifi Password", textEditingController: ssidName),
//         CustomButton(onTap: (){}, btnText: "Connect ")
//       ],
//     ),
//   ),
// )
