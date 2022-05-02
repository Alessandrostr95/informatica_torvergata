import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/bloc/news/provider.dart';
import 'package:mobile_app/bloc/news/bloc.dart';
import 'package:mobile_app/bloc/news/model.dart';

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocProvider(
      create: (context) =>
          NewsBloc(NewsApiClient(url: "http://192.168.1.15:8080/api/data/news"))
            ..add(LoadNewsEvent()),
      child: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.white70,
            ));
          } else if (state is NewsLoadedState) {
            return ListView(
              padding: const EdgeInsets.all(4),
              children: News.newsWidgetFrom(state.news),
            );
          } else if (state is NewsErrorState) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Ops! Something went wrong... :(",
                    style: TextStyle(
                      fontFamily: "monospace",
                      color: Colors.white70,
                    ),
                  ),
                  IconButton(
                      onPressed: () => BlocProvider.of<NewsBloc>(context)
                          .add(LoadNewsEvent()),
                      icon: const Icon(Icons.refresh, color: Colors.white70)),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
