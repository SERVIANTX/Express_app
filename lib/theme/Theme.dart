// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

double defaultMargin = 30.0;
double defaultBorder = 20.0;

Color kWhiteColor = const Color(0xffFFFFFF);
Color kBackgroundColor = const Color(0xff1A1A1A);
Color kGreyColor = const Color(0xff252525);
Color kPrimaryColor = const Color(0xffFEBE02);

// ignore: non_constant_identifier_names
Gradient Kcolorgradient =  LinearGradient(
                      colors: [
                        Colors.green.shade900,
                        Colors.green,
                        Colors.green.shade400,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                    );

TextStyle whiteTextStyle = GoogleFonts.poppins(
  color: kWhiteColor,
);
TextStyle blackTextStyle = GoogleFonts.poppins(
  color: kBackgroundColor,
);
TextStyle yellowTextStyle = GoogleFonts.poppins(
  color: kPrimaryColor,
);

FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;
FontWeight black = FontWeight.w900;

class AppDefaults {
  /// Default Paddding Value
  static const double padding = 16.00;

  /// Default Margin Value
  static const double margin = 16.00;

  /// Default Style Radius
  static const double radius = 32.00;

  /// Default BorderRadius
  static BorderRadius borderRadius = BorderRadius.circular(radius);

  /// Gradient that is used for the whole app
}