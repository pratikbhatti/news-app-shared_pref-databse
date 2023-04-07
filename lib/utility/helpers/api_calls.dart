import 'dart:convert';

import 'package:demo50/pages/homePage/controller/home_controller.dart';
import 'package:demo50/pages/homePage/modal/home_modal.dart';
import 'package:http/http.dart' as http;

class ApiCalls {
  ApiCalls._();
  static ApiCalls apiCalls = ApiCalls._();

  /// news api call
  Future<NewsApiModal?> newsApi({required String name}) async {
    String? news_api =
        "https://newsapi.org/v2/everything?q=tesla&from=2023-03-07&sortBy=publishedAt&apiKey=dd139bcde4e045e5b60bea63e5a9e41f";
    var response = await http.get(Uri.parse(news_api));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return NewsApiModal.fromJson(json);
    } else {
      return null;
    }
  }
}
