import 'package:flutter/material.dart';
import 'package:smarthome/features/Rooms/bed_room/view/widgets/bed_room_view_body.dart';


class BedRoomView extends StatelessWidget {
  const BedRoomView({Key? key}) : super(key: key);

  static const String id = 'bed_room';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BedRoomViewBody(),
    );
  }
}
