part of 'bloc.dart';

abstract class CalendarState extends Equatable {}

class CalendarLoadingState extends CalendarState {
  @override
  List<Object?> get props => [];
}

class CalendarLoadedState extends CalendarState {
  final Calendar calendar;

  CalendarLoadedState({required this.calendar});

  @override
  List<Object?> get props => [calendar];  
}

class CalendarErrorState extends CalendarState {
  final String error;

  CalendarErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}