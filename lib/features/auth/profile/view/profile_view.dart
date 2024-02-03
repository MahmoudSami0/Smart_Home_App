import 'package:flutter/material.dart';
import 'package:smarthome/features/auth/profile/view/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  static const String id = "ProfileView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body:  SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: ProfileViewBody(),
        ),
      ),
    );
  }
}
