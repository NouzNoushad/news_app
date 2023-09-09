import 'package:go_router/go_router.dart';
import 'package:news_app/data/model/top_headlines.dart';
import 'package:news_app/presentation/news_details.dart';
import 'package:news_app/routes/route_constant.dart';

import '../presentation/news_home.dart';

class Routes {
  static final GoRouter router = GoRouter(initialLocation: newsHomeRoute, routes: [
    GoRoute(path: newsHomeRoute, builder: (context, state) => const NewsHome()),
    GoRoute(path: newsDetailsRoute, builder: (context, state) =>  NewsDetails(
      news: state.extra as Article,
    )),
  ]);
}