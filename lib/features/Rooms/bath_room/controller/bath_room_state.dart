part of 'bath_room_cubit.dart';

abstract class BathRoomState {}

class BathRoomInitial extends BathRoomState {}
class PowerSwitchState extends BathRoomState {}
class DataLoading extends BathRoomState {}
class DataFailure extends BathRoomState {}
class DataSuccess extends BathRoomState {}

class SendLoadingState extends BathRoomState {}

class SendSuccessState extends BathRoomState {}

class SendFailureState extends BathRoomState{}
class DeviceState extends BathRoomState {}



