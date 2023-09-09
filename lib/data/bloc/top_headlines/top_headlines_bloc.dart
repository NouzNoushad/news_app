import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/data/repository/news_repository.dart';

import '../../model/top_headlines.dart';

part 'top_headlines_event.dart';
part 'top_headlines_state.dart';

class TopHeadlinesBloc extends Bloc<TopHeadlinesEvent, TopHeadlinesState> {
  final NewsRepository newsRepository;
  TopHeadlinesBloc({required this.newsRepository})
      : super(TopHeadlinesInitial()) {
    on<TopHeadlinesLoadedEvent>((event, emit) async {
      emit(TopHeadlinesLoadingState());
      try {
        List<Article> articles = await newsRepository.getTopHeadlines();
        emit(TopHeadlinesLoadedState(articles));
      } catch (error) {
        emit(TopHeadlinesErrorState(error.toString()));
      }
    });
  }
}
