import 'package:flutter/cupertino.dart';
import 'package:smarthome/features/auth/Login/view/widgets/sign_in_body.dart';
import 'package:smarthome/features/auth/Login/view/widgets/social_body.dart';


class LoginViewBody extends StatelessWidget {
  const LoginViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SignInBody(),
              SocialBody()

            ],
          ),
        ),
      ),
    );
  }
}
