import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:news_app/routes/route_constant.dart';
import '../data/model/top_headlines.dart';
import '../utils/colors.dart';

class NewsItem extends StatelessWidget {
  final Article topNews;
  const NewsItem({super.key, required this.topNews});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: ColorPicker.backgroundColor,
      child: GestureDetector(
        onTap: () => context.push(newsDetailsRoute, extra: topNews),
        child: Card(
          color: ColorPicker.backgroundColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
              side: BorderSide(
                  width: 1.5,
                  color: ColorPicker.primaryColor.withOpacity(0.6))),
          child: IntrinsicHeight(
            child: Row(children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        topNews.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          color: ColorPicker.textColor,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        DateFormat.yMMMMd()
                            .add_jm()
                            .format(topNews.publishedAt),
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: ColorPicker.primaryColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  child: topNews.urlToImage != null
                      ? ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: topNews.urlToImage.toString(),
                            placeholder: (context, url) => Container(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        )
                      : Container(),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
