
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:wifi_scan/wifi_scan.dart';

part 'wifi_state.dart';

class WifiCubit extends Cubit<WifiState> {
  WifiCubit() : super(WifiInitial());

  void wifiScan()async{


    await WiFiScan.instance.onScannedResultsAvailable.forEach((element) {


     emit(WifiScanned(wifi: element));

    });




  }
}
