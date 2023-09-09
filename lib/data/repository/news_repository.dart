import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:news_app/data/model/top_headlines.dart';

import '../../utils/end_points.dart';

class NewsRepository {
  Client baseClient = Client();
  final Map<String, String> headers = {'X-Api-Key': '${dotenv.env['API_KEY']}'};
  getTopHeadlines() async {
    debugPrint('to p');
    Uri uri = Uri.parse('$baseUrl/v2/top-headlines?country=$country');
    var response = await get(uri, headers: headers);
    debugPrint('//////////////////// response: ${response.body}');
    if (response.statusCode == 200) {
      debugPrint('//////////////////// response: ${response.body}');
      return topHeadlinesResponseFromJson(response.body).articles;
    } else {
      throw Exception('Unable to connect!');
    }
  }
}
