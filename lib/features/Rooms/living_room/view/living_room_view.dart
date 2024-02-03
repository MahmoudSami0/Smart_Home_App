import 'package:flutter/material.dart';
import 'package:smarthome/features/Rooms/living_room/view/widgets/living_view_body.dart';


class LivingView extends StatelessWidget {
  const LivingView({Key? key}) : super(key: key);

  static const String id = "LivingView";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LivingViewBody(),
    );
  }
}
