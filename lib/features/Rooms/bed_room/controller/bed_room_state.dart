part of 'bed_room_cubit.dart';

abstract class BedRoomState {}

class BedRoomInitial extends BedRoomState {}
class PowerSwitchState extends BedRoomState {}
class DataLoading extends BedRoomState {}
class DataFailure extends BedRoomState {}
class DataSuccess extends BedRoomState {}

class SendLoadingState extends BedRoomState {}

class SendSuccessState extends BedRoomState {}

class SendFailureState extends BedRoomState{}
class DeviceState extends BedRoomState {}



