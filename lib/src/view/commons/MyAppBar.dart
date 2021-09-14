import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  const MyAppBar({Key? key, this.h}) : super(key: key);
  final double? h;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "Tea News",
        style: GoogleFonts.getFont('Roboto',
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 22.0),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: <Widget>[
        IconButton(
          icon: const Icon(
            Icons.search,
            color: Colors.black,
          ),
          tooltip: 'Show Snackbar',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('This is a snackbar')));
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(h!);
}
