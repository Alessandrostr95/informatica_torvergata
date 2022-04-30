part of 'bloc.dart';

abstract class TeacherState extends Equatable {}

class TeacherLoadingState extends TeacherState {
  @override
  List<Object?> get props => [];
}

class TeacherLoadedState extends TeacherState {
  final List<Teacher> teachers;

  TeacherLoadedState({required this.teachers});

  @override
  List<Object?> get props => [teachers];  
}

class TeacherErrorState extends TeacherState {
  final String error;

  TeacherErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}