import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/features/settings/view/widgets/connection_setting.dart';
import 'package:smarthome/features/settings/view/widgets/wifi_item_ui.dart';

import '../../controller/wifi_cubit.dart';

class WifiListViewBuilder extends StatelessWidget {
  const WifiListViewBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WifiCubit, WifiState>(
      builder: (context, state) {
        if (state is WifiScanned) {
          return ListView.builder(
            itemBuilder: (context, index) => GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> ConnectionSetting(ssidName: state.wifi[index].ssid)));
              },
              child: WifiItemUI(
                wifi: state.wifi,
                index: index,
              ),
            ),
            itemCount: state.wifi.length,
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
