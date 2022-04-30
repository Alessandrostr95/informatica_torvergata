part of 'bloc.dart';

@immutable
abstract class TeacherEvent extends Equatable {
  const TeacherEvent();
}

class LoadTeacherEvent extends TeacherEvent {
  @override
  List<Object?> get props => [];
}