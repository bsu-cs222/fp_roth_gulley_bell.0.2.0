class YoutubeTrendsParser {
  String parseMultipleYoutubeTrends(dynamic jsonData, int numOfTrends) {
    List<String> youtubeTrends = [];
    numOfTrends = numOfTrends - 1;
    for (int i = 0; i <= numOfTrends; i++) {
      String trend = (jsonData['items'][i]['snippet']['title']);
      youtubeTrends.add(trend);
    }
    return youtubeTrends.join("\n");
  }
}
