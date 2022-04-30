import 'model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'provider.dart';

part 'state.dart';
part 'event.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsApiClient _apiClient;

  NewsBloc(this._apiClient) : super(NewsLoadingState()) {
    on<LoadNewsEvent>((event, emit) async {
      emit(NewsLoadingState());
      try {
        final news = await _apiClient.fetch();
        // throw Error();
        emit(NewsLoadedState(news: news));
      } catch (e) {
        emit(NewsErrorState(error: e.toString()));
      }
    });
  }
}