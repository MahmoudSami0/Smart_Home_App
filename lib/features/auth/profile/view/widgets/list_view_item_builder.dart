import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/features/auth/profile/Model/icon_model.dart';
import 'package:smarthome/features/auth/profile/account/view/edit_profile.dart';
import 'package:smarthome/features/auth/profile/controller/profile_cubit.dart';
import 'package:smarthome/features/auth/profile/view/widgets/list_item_view.dart';

class ListViewItemProfileBuilder extends StatelessWidget {
  ListViewItemProfileBuilder({Key? key}) : super(key: key);

  ////////// Will Be Added Into Cubit
  final List<IconModel> profile = [
    IconModel(
        iconPath: "assets/images/Icon_Edit-Profile.png",
        itemName: "Edit Profile"),

    IconModel(iconPath: "assets/images/Icon_Exit.png", itemName: "Log Out")
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
         if(state is ProfileLoadingState){

           BlocProvider.of<ProfileCubit>(context).isLoading = true;
         }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<ProfileCubit>(context);
          return ListItemView(
            isLoading: profile[index].itemName == "Log Out" ? cubit.isLoading : false,
            item: profile[index],
            onTap: () {
              if(profile[index].itemName == "Log Out"){
                cubit.logOut(context);
              }else{
               if( profile[index].itemName == "Edit Profile"){

                 Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfileView()));
              }
                if (kDebugMode) {
                  print(profile[index].itemName);
                }
              }

            },
          );
        },
      ),
      itemCount: profile.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(
        height: 20,
      ),
    );
  }
}
