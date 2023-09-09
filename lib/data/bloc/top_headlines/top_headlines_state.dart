part of 'top_headlines_bloc.dart';

sealed class TopHeadlinesState extends Equatable {
  const TopHeadlinesState();
  
  @override
  List<Object> get props => [];
}

final class TopHeadlinesInitial extends TopHeadlinesState {}

final class TopHeadlinesLoadingState extends TopHeadlinesState {}

class TopHeadlinesLoadedState extends TopHeadlinesState {
  final List<Article> articles;
  const TopHeadlinesLoadedState(this.articles);

  @override
  List<Object> get props => [articles];
}

class TopHeadlinesErrorState extends TopHeadlinesState {
  final String error;
  const TopHeadlinesErrorState(this.error);

  @override
  List<Object> get props => [error];
}
