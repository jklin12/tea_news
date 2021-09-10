import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tea_news/model/ModelCategory.dart';
import 'package:tea_news/widget/CategoryWidget.dart';
import 'package:tea_news/widget/MyAppBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //
  }

  @override
  Widget build(BuildContext context) {
    var orientasion = MediaQuery.of(context).orientation;
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    debugPrint(orientasion.toString() + ':' + w.toString());
    return Scaffold(
      appBar: MyAppBar(
        h: w > 1000 ? h / 10 : h / 12,
      ),
      body: SafeArea(child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 600) {
            return _buildWideContainers();
          } else {
            return _buildNormal(w);
          }
        },
      )),
    );
  }

  Widget _buildNormal(double w) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "News",
                  style: GoogleFonts.getFont('Roboto',fontSize: 18.0,fontWeight: FontWeight.w500),
                ),
                CategoryWidgdte()
              ],
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
