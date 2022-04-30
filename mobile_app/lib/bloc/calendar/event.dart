part of 'bloc.dart';

@immutable
abstract class CalendarEvent extends Equatable {
  const CalendarEvent();
}

class LoadCalendarEvent extends CalendarEvent {
  @override
  List<Object?> get props => [];
}