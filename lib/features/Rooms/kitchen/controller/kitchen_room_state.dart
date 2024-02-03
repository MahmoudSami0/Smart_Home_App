part of 'kitchen_room_cubit.dart';

abstract class KitchenState {}

class KitchenInitial extends KitchenState {}
class PowerSwitchState extends KitchenState {}
class DataLoading extends KitchenState {}
class DataFailure extends KitchenState {}
class DataSuccess extends KitchenState {}

class SendLoadingState extends KitchenState {}

class SendSuccessState extends KitchenState {}

class SendFailureState extends KitchenState{}
class DeviceState extends KitchenState {}



