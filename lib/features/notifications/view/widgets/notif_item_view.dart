import 'package:flutter/material.dart';
import 'package:smarthome/core/utils/widgets/custom_text.dart';
import 'package:smarthome/features/notifications/models/notifications_model.dart';

class NotificationItemView extends StatelessWidget {
  const NotificationItemView({Key? key, required this.model}) : super(key: key);

  final NotificationsModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      width: double.infinity,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child:  Row(
        children: [
          const Icon(Icons.notifications,size: 30,),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomText(text: model.title, fontSize: 22,maxLines: 1,isBold: true,),
                const SizedBox(
                  height: 10,
                ),
                CustomText(text: model.body, fontSize: 14,maxLines: 5,isBold: true,color: Colors.grey,),
              ],
            ),
          )
        ],
      ),
    );
  }
}
