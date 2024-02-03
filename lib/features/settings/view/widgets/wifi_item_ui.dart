import 'package:flutter/material.dart';
import 'package:wifi_scan/wifi_scan.dart';


import '../../../../core/utils/widgets/custom_text.dart';

class WifiItemUI extends StatelessWidget {
  const WifiItemUI({Key? key, required this.wifi, required this.index})
      : super(key: key);

  final List<WiFiAccessPoint> wifi;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24), color: Colors.white),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        height: MediaQuery.of(context).size.height * 0.15,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              wifibar(wifi[index].level) ,
              size: (MediaQuery.of(context).size.width)*0.15.toDouble(),
              color: Colors.blue,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      top: 20,
                      bottom: 10,
                    ),

                    child: CustomText(

                      text: nameWifi(wifi[index].frequency, wifi[index].ssid)!,
                      isBold: true,
                      fontSize: 18,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 30, bottom: 10),
                      child: CustomText(
                        text: wifi[index].bssid,
                        fontSize: 14,
                      )),
                ],
              ),
            ),

            CustomText(
              text: wifi[index].level.toString(),
              fontSize: 24,
              isBold: true,
            ),

          ],
        ));
  }


  IconData? wifibar(
     int level
      ){
   if(level < -60){
     if(level < -10){
       return Icons.network_wifi_1_bar;
     }else if(level > -10){
       return Icons.network_wifi_2_bar_outlined;
     }
   }else{
     if(level < -75){
       return Icons.network_wifi_3_bar_outlined;
     }else{
       return Icons.network_wifi_outlined;
     }
   }
   return null;
  }

  String? nameWifi(int frec,String name){
    if(frec < 3000){
      return name;
    }else{
      return "$name  5G";
    }
  }
}



