part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}
class ProfileLoadingState extends ProfileState{}
class ProfileSuccessState extends ProfileState{}
class ProfileFailureState extends ProfileState{}
class ProfileInitial extends ProfileState {}
