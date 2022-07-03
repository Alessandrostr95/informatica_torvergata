part of 'bloc.dart';

abstract class ExamState extends Equatable {}

class ExamLoadingState extends ExamState {
  @override
  List<Object?> get props => [];
}

class ExamLoadedState extends ExamState {
  final List<Exam> exams;

  ExamLoadedState({required this.exams});

  @override
  List<Object?> get props => [exams];  
}

class ExamErrorState extends ExamState {
  final String error;

  ExamErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}