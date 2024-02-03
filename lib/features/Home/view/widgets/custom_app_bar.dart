import 'package:flutter/material.dart';

import '../../../auth/Login/model/user_model.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.color, required this.url})
      : super(key: key);

  final Color color;
  final UsersModel url;
  final imageProvider = const AssetImage('assets/images/menu.png');

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: Image(
            image: imageProvider,
            color: color,
          ),
          onPressed: () {},
        ),
        CircleAvatar(radius: 30, backgroundImage: NetworkImage(url.photoUrl),backgroundColor: Colors.white,)
      ],
    );
  }
}
