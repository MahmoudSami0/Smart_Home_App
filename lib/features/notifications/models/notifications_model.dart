import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationsModel {
  final String title;
  final String body;
  final String id;
  final String uid;
  final Timestamp time;

  NotificationsModel(
      {required this.uid,
        required this.title,
      required this.body,
      required this.id,
      required this.time});

  factory NotificationsModel.fromJson(dynamic jsonResponse) {

    return NotificationsModel(
     title: jsonResponse['title'], body: jsonResponse['body'], id: jsonResponse['id'], time: jsonResponse['time'], uid: jsonResponse['uid'],
    );
  }



}


