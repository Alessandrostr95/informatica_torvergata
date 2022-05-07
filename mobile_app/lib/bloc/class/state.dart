part of 'bloc.dart';

abstract class ClassState extends Equatable {}

class ClassLoadingState extends ClassState {
  @override
  List<Object?> get props => [];
}

class ClassLoadedState extends ClassState {
  final List<Class> classes;

  ClassLoadedState({required this.classes});

  @override
  List<Object?> get props => [classes];  
}

class ClassErrorState extends ClassState {
  final String error;

  ClassErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}