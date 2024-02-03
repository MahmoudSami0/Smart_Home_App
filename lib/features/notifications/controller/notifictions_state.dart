part of 'notifictions_cubit.dart';

abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoadingState extends NotificationsState {}

class NotificationsSuccessState extends NotificationsState {
  final List<NotificationsModel> model;

  NotificationsSuccessState({required this.model});
}

class NotificationsFailureState extends NotificationsState {}
