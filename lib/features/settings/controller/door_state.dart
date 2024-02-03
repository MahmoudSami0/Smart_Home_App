part of 'door_cubit.dart';

@immutable
abstract class DoorState {}

class PasswordState extends DoorState {}

class DoorInitial extends DoorState {}

class DataLoading extends DoorState {}

class DataFailure extends DoorState {}

class DataSuccess extends DoorState {

}

class ChangePasswordState extends DoorState {}

class ChangePasswordLoading extends DoorState {}

class ChangePasswordFailure extends DoorState {}
