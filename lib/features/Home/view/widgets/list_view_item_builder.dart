import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smarthome/features/Home/view/widgets/list_view_item.dart';
import 'package:smarthome/features/Rooms/garage/view/garage_view.dart';
import 'package:smarthome/features/Rooms/kitchen/view/kitchen_view.dart';



import '../../../Rooms/bath_room/view/bath_room_view.dart';
import '../../../Rooms/bed_room/view/bed_room_view.dart';
import '../../../Rooms/living_room/view/living_room_view.dart';

class ListViewItemBuilder extends StatelessWidget {
  ListViewItemBuilder({Key? key}) : super(key: key);

  ///////// Will move to cubit /////////

  final List myRooms = [
    ['Living Room', 'assets/images/living-room.jpg', LivingView.id],
    ['Bed Room', 'assets/images/bedroom-background.jpg', BedRoomView.id],
    ['Bath Room', 'assets/images/bathRoom.jpg', BathRoomView.id],
    ['Kitchen ', 'assets/images/kitchenroom.jpg', KitchenView.id],
    ['Garage ', 'assets/images/garage.jpg', GarageView.id],
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.2,
      child: GridView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ListViewItem(
          imgPath: myRooms[index][1],
          room: myRooms[index][0],
          screen: myRooms[index][2],
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, childAspectRatio: 1.3 / 1.4),
        itemCount: myRooms.length,
      ),
    );
  }
}
