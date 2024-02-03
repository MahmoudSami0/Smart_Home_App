import 'package:flutter/material.dart';

import 'package:smarthome/features/notifications/view/widgets/notif_list_view_builder.dart';


class NotificationsBodyView extends StatelessWidget {
  const NotificationsBodyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const NotificationsListViewBuilder();
  }
}
