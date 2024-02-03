import 'package:flutter/material.dart';
import 'package:smarthome/features/auth/rgester/view/widgets/signup_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key? key}) : super(key: key);

  static const String id = "RegisterView";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body:const SafeArea(child: SignUpBody()),
    );
  }
}
