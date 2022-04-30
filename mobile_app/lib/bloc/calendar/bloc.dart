import 'model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'provider.dart';

part 'state.dart';
part 'event.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  final CalendarApiClient _apiClient;

  CalendarBloc(this._apiClient) : super(CalendarLoadingState()) {
    on<LoadCalendarEvent>((event, emit) async {
      emit(CalendarLoadingState());
      try {
        final _calendar = await _apiClient.fetch();
        // throw Error();
        emit(CalendarLoadedState(calendar: _calendar));
      } catch (e) {
        print(e.toString());
        emit(CalendarErrorState(error: e.toString()));
      }
    });
  }
}