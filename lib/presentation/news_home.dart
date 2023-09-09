import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/data/bloc/top_headlines/top_headlines_bloc.dart';
import 'package:news_app/utils/colors.dart';

import 'news_item.dart';

class NewsHome extends StatelessWidget {
  const NewsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      body: BlocConsumer<TopHeadlinesBloc, TopHeadlinesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TopHeadlinesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(color: ColorPicker.primaryColor),
            );
          }
          if (state is TopHeadlinesLoadedState) {
            return CustomScrollView(
              slivers: [
                const SliverAppBar(
                  title: Text('News'),
                  backgroundColor: ColorPicker.backgroundColor,
                  pinned: true,
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  sliver: SliverList.separated(
                      itemCount: state.articles.length,
                      itemBuilder: (context, index) {
                        var topNews = state.articles[index];
                        return NewsItem(
                          topNews: topNews,
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 0,
                          )),
                )
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
