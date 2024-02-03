

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;


part 'connection_state.dart';

class ConnectionCubit extends Cubit<ConnectionStates> {
  ConnectionCubit() : super(ConnectionInitial());


  bool isPassword = false;

  void changepassword() {
    isPassword = !isPassword;
    emit(PasswordState());
  }


  Future<void> sendCredentials(String ssid, String password) async {
    emit(ConnectionLoading());
    final response = await http.post(
      Uri.parse('http://192.168.4.1/'),
      body: {'ssid': ssid, 'password': password},
    ).then((value) {
      if (value.statusCode == 200) {
        emit(ConnectionSuccess());
        print('Credentials sent successfully');
      }
    }).catchError((e){
      emit(ConnectionFailure());
    });

    if (response.statusCode == 200) {
      emit(ConnectionSuccess());
      print('Credentials sent successfully');
    } else {
      print('Failed to send credentials');
    }
  }
}