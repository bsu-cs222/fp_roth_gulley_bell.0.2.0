import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:trending_app/news_trends_parser.dart';

void main() {
  final newsParser = NewsTrendsParser();
  test(
      "Monkey mayhem in South Carolina after 43 primates escape research facility - CNN is the first trending news article",
      () async {
    final jsonObject = await _loadSampleData('news_trends_query.json');
    final firstTrend = newsParser.parseFirstNewsTrend(jsonObject);
    expect(firstTrend,
        "Monkey mayhem in South Carolina after 43 primates escape research facility - CNN");
  });

  test("The top five trending news articles will be returned", () async {
    final jsonObject = await _loadSampleData('news_trends_query.json');
    final firstFiveTrends = newsParser.parseMultipleNewsTrends(jsonObject, 5);
    expect(firstFiveTrends,
        "1. Monkey mayhem in South Carolina after 43 primates escape research facility - CNN\n2. University of Idaho murder suspect back in court for death penalty arguments - Fox News\n3. Mortgage rates rise again amid election volatility - Yahoo Finance\n4. How Elon Musk’s \$130 million investment in Trump\'s victory could reap a huge payoff for Tesla and the rest of his business empire - Fortune\n5. PFT’s Week 10 2024 NFL picks: Florio vs. Simms - NBC Sports");
  });
}

dynamic _loadSampleData(String testFileName) async {
  final jsonEncodedResponse = await File('test/$testFileName').readAsString();
  return jsonDecode(jsonEncodedResponse);
}
