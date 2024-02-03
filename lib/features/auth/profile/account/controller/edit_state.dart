part of 'edit_cubit.dart';

abstract class EditState {}

class EditInitial extends EditState {}

class DataLoadingState extends EditState {}
class PostImagePickedSuccess extends EditState{}
class PostImagePickedError extends EditState{}
class DataSuccessState extends EditState {
  UsersModel model;

  DataSuccessState({required this.model});
}

class DataFailureState extends EditState {}

class UpdateLoadingState extends EditState {}

class UpdateSuccessState extends EditState {}

class UpdateFailureState extends EditState {}
