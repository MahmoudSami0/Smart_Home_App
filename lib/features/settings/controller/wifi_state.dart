part of 'wifi_cubit.dart';


abstract class WifiState {}

class WifiInitial extends WifiState {}
class WifiLoading extends WifiState {}

class WifiScanned extends WifiState {
  final  List<WiFiAccessPoint> wifi;

  WifiScanned({required this.wifi});
}
