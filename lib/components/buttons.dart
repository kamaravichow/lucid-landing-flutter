import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilledButton extends StatelessWidget {
  final Function() onClicked;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  const FilledButton({
    Key? key,
    this.text = "None",
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClicked,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          text,
          style: GoogleFonts.nunitoSans(
            textStyle: TextStyle(
              fontSize: 14,
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
