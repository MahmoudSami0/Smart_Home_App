import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../../../core/utils/widgets/custom_text.dart';

import '../../../Login/controller/login_cubit.dart';
import '../../../Login/model/user_model.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if(state is DataLoadingState){
          BlocProvider.of<LoginCubit>(context).isDataLoading = true;
        }
      },
      builder: (context, state) {
        var cubit =  BlocProvider.of<LoginCubit>(context);
        if(cubit.model.length == 0){
          return  Center(child: CircularProgressIndicator(),);
        }else{
          UsersModel model = cubit.model[0];
          return cubit.isDataLoading ? Center(child: CircularProgressIndicator(),):

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage: NetworkImage(model.photoUrl)
              ),
              const SizedBox(
                width: 40,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: model.name, fontSize: 20, isBold: true,),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomText(text: model.email, fontSize: 14,),
                  ],
                ),
              )
            ],
          );
        }

      },
    );
  }
}
