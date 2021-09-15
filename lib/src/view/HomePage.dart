import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tea_news/src/controller/news_controller.dart';
import 'package:tea_news/src/view/commons/MyAppBar.dart';
import 'package:tea_news/src/view/widget/Headline.dart';
import 'package:tea_news/src/view/widget/HomeCategory.dart';

class HomePage extends StatelessWidget {
  final NewsController _newsController = Get.find<NewsController>();

  @override
  Widget build(BuildContext context) {
    var orientasion = MediaQuery.of(context).orientation;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    debugPrint(orientasion.toString() + ':' + w.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(
        h: w > 1000 ? h / 10 : h / 12,
      ),
      body: SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideContainers();
          } else {
            return _buildNormal(w, h);
          }
        },
      )),
    );
  }

  Widget _buildNormal(double w, double h) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomeCategory(),
            Headlines(h, w, _newsController),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "General",
                style: GoogleFonts.getFont('Roboto',
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWideContainers() {
    return Container();
  }
}
