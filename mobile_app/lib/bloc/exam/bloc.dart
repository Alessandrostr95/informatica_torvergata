import 'model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'provider.dart';

part 'state.dart';
part 'event.dart';

class ExamBloc extends Bloc<ExamEvent, ExamState> {
  final ExamApiClient _apiClient;

  ExamBloc(this._apiClient) : super(ExamLoadingState()) {
    on<LoadExamEvent>((event, emit) async {
      emit(ExamLoadingState());
      try {
        final _exams = await _apiClient.fetch();
        // throw Error();
        emit(ExamLoadedState(exams: _exams));
      } catch (e) {
        print(e.toString());
        emit(ExamErrorState(error: e.toString()));
      }
    });
  }
}