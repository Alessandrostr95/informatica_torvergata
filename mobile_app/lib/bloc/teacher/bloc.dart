import 'model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'provider.dart';

part 'state.dart';
part 'event.dart';

class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  final TeacherApiClient _apiClient;

  TeacherBloc(this._apiClient) : super(TeacherLoadingState()) {
    on<LoadTeacherEvent>((event, emit) async {
      emit(TeacherLoadingState());
      try {
        final _teachers = await _apiClient.fetch();
        // throw Error();
        emit(TeacherLoadedState(teachers: _teachers));
      } catch (e) {
        print(e.toString());
        emit(TeacherErrorState(error: e.toString()));
      }
    });
  }
}