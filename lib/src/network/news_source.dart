import 'package:tea_news/src/network/base_network.dart';

class NewsDataSource {
  static NewsDataSource instanec = NewsDataSource();

  Future<Map<String, dynamic>> loadHeadLineNews() {
    return BaseNetwork.get(
        "top-headlines?apiKey=b2c417a4e881420e9bca47ef090b8734&country=id");
  }
}
