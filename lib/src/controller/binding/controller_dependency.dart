import 'package:get/get.dart';
import 'package:tea_news/src/controller/news_controller.dart';
import 'package:tea_news/src/network/news_source.dart';

void bindingNewsController() => Get.lazyPut<NewsController>(
    () => NewsController(newsDataSource: Get.find<NewsDataSource>()));
