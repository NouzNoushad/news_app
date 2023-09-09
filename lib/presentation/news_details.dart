import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/utils/colors.dart';

import '../data/model/top_headlines.dart';

class NewsDetails extends StatelessWidget {
  final Article news;
  const NewsDetails({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPicker.backgroundColor,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            backgroundColor: ColorPicker.backgroundColor,
            title: Text('News Details'),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
            sliver: SliverList(
                delegate: SliverChildListDelegate.fixed([
              Text(
                news.title,
                style: const TextStyle(
                    color: ColorPicker.textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                child: news.urlToImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: news.urlToImage.toString(),
                          placeholder: (context, url) => Container(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          color: ColorPicker.textColor.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                DateFormat.yMMMMd().add_jm().format(news.publishedAt),
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 13,
                  color: ColorPicker.primaryColor,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                news.description.toString(),
                style: const TextStyle(
                    color: ColorPicker.textColor,
                    fontSize: 14.5,
                    height: 1.4,
                    letterSpacing: 0.5),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    news.author.toString(),
                    style: const TextStyle(
                        color: ColorPicker.primaryColor,
                        fontSize: 12.5,
                        letterSpacing: 0.5),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    news.source.name.toString(),
                    style: const TextStyle(
                        color: ColorPicker.primaryColor,
                        fontSize: 12.5,
                        letterSpacing: 0.5),
                  ),
                ],
              )
            ])),
          )
        ],
      ),
    );
  }
}
