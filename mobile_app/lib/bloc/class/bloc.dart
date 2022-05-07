import 'model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'provider.dart';

part 'state.dart';
part 'event.dart';

class ClassBloc extends Bloc<ClassEvent, ClassState> {
  final ClassApiClient _apiClient;

  ClassBloc(this._apiClient) : super(ClassLoadingState()) {
    on<LoadClassEvent>((event, emit) async {
      emit(ClassLoadingState());
      try {
        final _classes = await _apiClient.fetch();
        // throw Error();
        emit(ClassLoadedState(classes: _classes));
      } catch (e) {
        print(e.toString());
        emit(ClassErrorState(error: e.toString()));
      }
    });
  }
}