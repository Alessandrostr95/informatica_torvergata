part of 'bloc.dart';

abstract class NewsState extends Equatable {}

class NewsLoadingState extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoadedState extends NewsState {
  final List<News> news;

  NewsLoadedState({required this.news});

  @override
  List<Object?> get props => [news];  
}

class NewsErrorState extends NewsState {
  final String error;

  NewsErrorState({required this.error});

  @override
  List<Object?> get props => [error];

}



