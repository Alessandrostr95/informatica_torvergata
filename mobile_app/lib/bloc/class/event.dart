part of 'bloc.dart';

@immutable
abstract class ClassEvent extends Equatable {
  const ClassEvent();
}

class LoadClassEvent extends ClassEvent {
  @override
  List<Object?> get props => [];
}