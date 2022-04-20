part of 'typeform_model_bloc.dart';

abstract class TypeformModelState extends Equatable {
  const TypeformModelState();

  @override
  List<Object> get props => [];
}

class TypeformModelInitial extends TypeformModelState {}

class TypeformModelLoading extends TypeformModelState {}

class TypeformModelSuccess extends TypeformModelState {
  final UsersModel usersModel;
  const TypeformModelSuccess(this.usersModel);
}

class TypeformModelError extends TypeformModelState {
  final String? message;
  const TypeformModelError(this.message);
}
