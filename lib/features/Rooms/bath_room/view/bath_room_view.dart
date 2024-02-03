import 'package:flutter/material.dart';
import 'package:smarthome/features/Rooms/bath_room/view/widgets/bath_room_view_body.dart';


class BathRoomView extends StatelessWidget {
  const BathRoomView({Key? key}) : super(key: key);

  static const String id = 'bath_room';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BathRoomViewBody(),
    );
  }
}
