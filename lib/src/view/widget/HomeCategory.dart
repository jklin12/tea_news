import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tea_news/src/controller/news_controller.dart';
import 'package:tea_news/src/model/category_model.dart';

class HomeCategory extends StatelessWidget {
  final NewsController _newsController = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
        height: 50.0,
        width: w,
        child: Obx(
          () => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _newsController.catModel.length,
              itemBuilder: (context, index) {
                var catModel = _newsController.catModel;
                return Obx(() => _newsController.selectedCategory.value ==
                        catModel[index].id
                    ? Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          catModel[index].name,
                          style: GoogleFonts.getFont('Roboto',
                              color: Colors.black,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          _newsController.selectedCategory.value =
                              catModel[index].id;
                          catModel.insert(
                              0,
                              ModelCategory(
                                  catModel[index].id, catModel[index].name));
                          catModel.removeAt(index + 1);
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0XFFd9dde0)),
                          child: Center(
                              child: FittedBox(
                            fit: BoxFit.contain,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0, vertical: 3.0),
                              child: Text(
                                catModel[index].name,
                                style: GoogleFonts.getFont('Roboto',
                                    fontSize: 15.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          )),
                        ),
                      ));
              }),
        ));
  }
}
