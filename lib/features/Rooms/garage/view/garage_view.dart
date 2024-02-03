import 'package:flutter/material.dart';
import 'package:smarthome/features/Rooms/garage/view/widgets/garage_view_body.dart';


class GarageView extends StatelessWidget {
  const GarageView({Key? key}) : super(key: key);

  static const String id = 'garage';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: GarageViewBody(),
    );
  }
}
