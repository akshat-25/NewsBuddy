// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Modifiedtext extends StatelessWidget {
  const Modifiedtext({
    Key? key,
    required this.text,
    required this.size,
    required this.color,
  }) : super(key: key);
  final String text;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(color: color, fontSize: size),
    );
  }
}

class Boldtext extends StatelessWidget {
  const Boldtext({
    Key? key,
    required this.text,
    required this.size,
    required this.color,
  }) : super(key: key);
  final String text;
  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          color: color, fontSize: size, fontWeight: FontWeight.bold),
    );
  }
}
