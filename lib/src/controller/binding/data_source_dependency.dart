import 'package:get/get.dart';
import 'package:tea_news/src/network/news_source.dart';

void bindingNewsDataSource() =>
    Get.lazyPut<NewsDataSource>(() => NewsDataSource());
