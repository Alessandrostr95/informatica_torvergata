part of 'bloc.dart';

@immutable
abstract class NewsEvent extends Equatable {
  const NewsEvent();
}

class LoadNewsEvent extends NewsEvent {
  @override
  List<Object?> get props => [];
}