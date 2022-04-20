part of 'typeform_model_bloc.dart';

abstract class TypeformModelEvent extends Equatable {
  const TypeformModelEvent();

  @override
  List<Object> get props => [];
}

class GetTypeFormList extends TypeformModelEvent {}
