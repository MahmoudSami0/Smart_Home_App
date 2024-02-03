import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:smarthome/features/Home/controller/home_cubit.dart';


import 'package:smarthome/features/auth/Login/view/login_view.dart';



part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  bool isLoading = false;

  void logOut(BuildContext context) async {
    emit(ProfileLoadingState());
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.restorablePopAndPushNamed(context, LoginView.id);

      BlocProvider.of<HomeCubit>(context).index = 0;

      isLoading = false;
      emit(ProfileSuccessState());
    }).catchError((onError) {
      if (kDebugMode) {
        print(onError.toString());
      }
      isLoading = false;
      emit(ProfileFailureState());
    });
  }
}
