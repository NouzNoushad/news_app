part of 'top_headlines_bloc.dart';

sealed class TopHeadlinesEvent extends Equatable {
  const TopHeadlinesEvent();

  @override
  List<Object> get props => [];
}

class TopHeadlinesLoadedEvent extends TopHeadlinesEvent {
  const TopHeadlinesLoadedEvent();

  @override
  List<Object> get props => [];
}
