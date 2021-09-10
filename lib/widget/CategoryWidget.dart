import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tea_news/model/ModelCategory.dart';

class CategoryWidgdte extends StatefulWidget {
  const CategoryWidgdte({Key? key}) : super(key: key);

  @override
  _CategoryWidgdteState createState() => _CategoryWidgdteState();
}

class _CategoryWidgdteState extends State<CategoryWidgdte> {
  final catModel = [
    ModelCategory('1', "asd"),
    ModelCategory('2', "BCD"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: catModel.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0XFFd9dde0)),
              child: Center(
                  child: FittedBox(
                fit: BoxFit.contain,
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    catModel[index].name,
                    style: GoogleFonts.getFont('Roboto',fontWeight: FontWeight.w500),
                  ),
                ),
              )),
            );
          }),
    );
  }
}
