import 'package:tea_news/src/model/article_model.dart';
import 'package:tea_news/src/model/category_model.dart';
import 'package:tea_news/src/network/news_source.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  NewsDataSource? newsDataSource;

  NewsController({this.newsDataSource});

  var headlineModel = ArticleModel().obs;
  var isLoading = true.obs;
  var selectedCategory = ''.obs;

  var catModel = [
    ModelCategory('', "Headlines"),
    ModelCategory('business', "Business"),
    ModelCategory('health', "Health"),
    ModelCategory('entertainment', "Entertainment"),
    ModelCategory('science', "Science"),
    ModelCategory('sports', "Sports"),
    ModelCategory("technology", "Technology")
  ].obs;

  @override
  void onInit() {
    print("GlobalController - onInit");
    _getHeadlineData(selectedCategory.value);

    super.onInit();
  }

  @override
  void onReady() {
    ever(selectedCategory, (_) async {
      isLoading.value = true;
      var data = await newsDataSource!.loadHeadLineNews(selectedCategory.value);
      var headlineResponse = ArticleModel.fromJson(data);
      if (headlineResponse.status == 'ok') {
        headlineModel.value = headlineResponse;
        isLoading.value = false;
      }

    });
    super.onReady();
  }

  _getHeadlineData(String sCategory) async {
    var data = await newsDataSource!.loadHeadLineNews(sCategory);

    var headlineResponse = ArticleModel.fromJson(data);
    if (headlineResponse.status == 'ok') {
      headlineModel.value = headlineResponse;
      isLoading.value = false;
    }
  }
}
