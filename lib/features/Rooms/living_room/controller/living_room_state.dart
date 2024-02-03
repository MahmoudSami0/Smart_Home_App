part of 'living_room_cubit.dart';

abstract class LivingRoomState {}

class LivingRoomInitial extends LivingRoomState {}
class PowerSwitchState extends LivingRoomState {}
class DataLoading extends LivingRoomState {}
class DataFailure extends LivingRoomState {}
class DataSuccess extends LivingRoomState {}

class SendLoadingState extends LivingRoomState {}

class SendSuccessState extends LivingRoomState {}

class SendFailureState extends LivingRoomState{}
class DeviceState extends LivingRoomState {}



