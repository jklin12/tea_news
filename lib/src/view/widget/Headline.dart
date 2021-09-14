import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tea_news/src/controller/news_controller.dart';

class Headlines extends StatelessWidget {
  final double h;
  final double w;
  final NewsController _newsController;
  const Headlines(this.h, this.w, this._newsController);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: h / 4,
        child: Obx(
          () => _newsController.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount:
                      _newsController.headlineModel.value.articles!.length,
                  itemBuilder: (context, index) {
                    var data = _newsController.headlineModel.value.articles!;
                    return Container(
                      margin: EdgeInsets.all(8.0),
                      width: w / 1.2,
                      height: h / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0XFFd9dde0),
                        image: DecorationImage(
                            image: NetworkImage(data[index].urlToImage!),
                            fit: BoxFit.cover),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: w / 2,
                              child: Text(
                                data[index].title!,
                                maxLines: 2,
                                style: GoogleFonts.getFont("Roboto",
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            ),
                            RichText(
                              text: TextSpan(
                                text: data[index].author!,
                                style: GoogleFonts.getFont("Roboto",
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white,
                                    fontStyle: FontStyle.italic),
                              ),
                            ),
                            SizedBox(
                              height: 8.0,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
        ));
  }
}
