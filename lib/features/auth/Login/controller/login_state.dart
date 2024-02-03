part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginSuccessState extends LoginState {}

class LoginFailureState extends LoginState {}

class Password extends LoginState {}
class DataLoadingState extends LoginState {}

class DataSuccessState extends LoginState {}

class DataFailureState extends LoginState {}
class UpdateLoadingState extends LoginState {}

class UpdateSuccessState extends LoginState {}

class UpdateFailureState extends LoginState {}

class RegisterInitialState extends LoginState {}

class RegisterLoadingState extends LoginState {}

class RegisterSuccessState extends LoginState {}

class RegisterFailureState extends LoginState {}

class SendNotify extends LoginState {}

class GoogleLoadingState extends LoginState {}

class GoogleSuccessState extends LoginState {}

class GoogleFailureState extends LoginState {}

class PasswordState extends LoginState {}
