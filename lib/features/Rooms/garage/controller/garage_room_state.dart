part of 'garage_room_cubit.dart';

abstract class GarageRoomState {}

class GarageRoomInitial extends GarageRoomState {}
class PowerSwitchState extends GarageRoomState {}
class DataLoading extends GarageRoomState {}
class DataFailure extends GarageRoomState {}
class DataSuccess extends GarageRoomState {}

class SendLoadingState extends GarageRoomState {}

class SendSuccessState extends GarageRoomState {}

class SendFailureState extends GarageRoomState{}
class DeviceState extends GarageRoomState {}



