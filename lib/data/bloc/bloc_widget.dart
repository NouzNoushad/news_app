import 'package:flutter/material.dart';
import 'package:news_app/data/bloc/top_headlines/top_headlines_bloc.dart';
import 'package:news_app/data/repository/news_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocWidget extends StatelessWidget {
  final Widget child;
  const BlocWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => NewsRepository(),
      child: BlocProvider(
        create: (context) => TopHeadlinesBloc(
            newsRepository: RepositoryProvider.of<NewsRepository>(context))
          ..add(const TopHeadlinesLoadedEvent()),
        child: child,
      ),
    );
  }
}
