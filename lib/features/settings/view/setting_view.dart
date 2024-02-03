import 'package:flutter/material.dart';
import 'package:smarthome/core/helper/navegate_to.dart';
import 'package:smarthome/features/settings/view/widgets/door_setting.dart';
import 'package:smarthome/features/settings/view/widgets/setting_item_view.dart';
import 'package:smarthome/features/settings/view/widgets/wifi_scan_body.dart';

import '../../auth/profile/Model/icon_model.dart';

class SettingView extends StatelessWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SettingItemView(
              onTap: () {
                navigatorTo(context, WifiScanBody.id);
              },
              item: IconModel(
                  iconPath: "assets/images/internet-of-things.png",
                  itemName: "Connect To IOT Device"),
            ),
            SizedBox(
              height: 30,
            ),
            SettingItemView(
              onTap: () {
                navigatorTo(context, DoorSetting.id);
              },
              item: IconModel(
                  iconPath: "assets/images/door.png",
                  itemName: "Password Of Door"),
            )
          ],
        ),
      )),
    );
  }
}
