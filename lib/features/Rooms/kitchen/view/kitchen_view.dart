import 'package:flutter/material.dart';
import 'package:smarthome/features/Rooms/kitchen/view/widgets/kitchen_view_body.dart';



class KitchenView extends StatelessWidget {
  const KitchenView({Key? key}) : super(key: key);

  static const String id = 'KitchenView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: KitchenViewBody(),
    );
  }
}
