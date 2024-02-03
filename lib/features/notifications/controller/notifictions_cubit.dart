import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smarthome/features/notifications/models/notifications_model.dart';

part 'notifictions_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());

  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('masseges');
  void getData() async {
    emit(NotificationsLoadingState());
    print("1");
    try {
      List<NotificationsModel> model = [];
      collectionReference.snapshots().listen((event) {
        String idm = FirebaseAuth.instance.currentUser!.uid;
        model.clear();
        for (int i = 0; i < event.docs.length; i++) {
          if (event.docs[i]['uid'] == idm) {
            model.add(NotificationsModel.fromJson(event.docs[i]));
          }
        }
        print("2");
        emit(NotificationsSuccessState(model: model));
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      print("3");
      emit(NotificationsFailureState());
    }
  }
}
