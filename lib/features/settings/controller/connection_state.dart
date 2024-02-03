part of 'connection_cubit.dart';


abstract class ConnectionStates {}

class ConnectionInitial extends ConnectionStates {}
class PasswordState extends ConnectionStates{}
class ConnectionLoading extends ConnectionStates {}

class ConnectionFailure extends ConnectionStates {}

class ConnectionSuccess extends ConnectionStates {
}

