import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:juan_test/models/users_models.dart';
import 'package:juan_test/services/repository.dart';

part 'typeform_model_event.dart';
part 'typeform_model_state.dart';

class TypeformModelBloc extends Bloc<TypeformModelEvent, TypeformModelState> {
  TypeformModelBloc() : super(TypeformModelInitial()) {
    final Repository _apiRepository = Repository();

    on<GetTypeFormList>((event, emit) async {
      try {
        emit(TypeformModelLoading());
        final tList = await _apiRepository.getData();
        emit(TypeformModelSuccess(tList));
        if (tList.error != null) {
          emit(TypeformModelError(tList.error));
        }
      } catch (e) {
        // ignore: avoid_print
        print(e.toString());
      }
    });
  }
}
