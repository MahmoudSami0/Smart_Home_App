import 'package:flutter/material.dart';
import 'package:smarthome/features/notifications/view/widgets/notifications_body_view.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: NotificationsBodyView())
    );
  }
}
