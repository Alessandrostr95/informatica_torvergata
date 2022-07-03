part of 'bloc.dart';

@immutable
abstract class ExamEvent extends Equatable {
  const ExamEvent();
}

class LoadExamEvent extends ExamEvent {
  @override
  List<Object?> get props => [];
}