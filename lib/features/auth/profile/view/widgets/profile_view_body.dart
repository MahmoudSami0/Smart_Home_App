
import 'package:flutter/material.dart';
import 'package:smarthome/features/auth/profile/view/widgets/list_view_item_builder.dart';


import 'package:smarthome/features/auth/profile/view/widgets/profile_info.dart';


class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return  Column(
    // mainAxisSize: MainAxisSize.min,
      children: [
         const Padding(
           padding: EdgeInsets.only(top: 16),
           child: ProfileInfo(),
         ),
        const SizedBox(
          height: 50,
        ),
        const Divider(

          indent: 2,
          thickness: 2,
          height: 5,
        ),
        const SizedBox(
          height: 50,
        ),
        Expanded(child: ListViewItemProfileBuilder())
      ],
    );
  }
}

