import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as ui show TextHeightBehavior;

class MyText extends Text {
  MyText(
      String data, {
        Key key,
        TextStyle style,
        StrutStyle strutStyle,
        TextAlign textAlign,
        TextDirection textDirection,
        Locale locale,
        bool softWrap,
        TextOverflow overflow,
        double textScaleFactor,
        int maxLines,
        String semanticsLabel,
        TextWidthBasis textWidthBasis,
        ui.TextHeightBehavior textHeightBehavior,
      }) : super(
    data,
    style: (style != null
        ? GoogleFonts.poppins().merge(style)
        : GoogleFonts.poppins()),
    strutStyle: strutStyle,
    textAlign: textAlign,
    textDirection: textDirection,
    locale: locale,
    softWrap: softWrap,
    overflow: overflow,
    textScaleFactor: textScaleFactor,
    maxLines: maxLines,
    semanticsLabel: semanticsLabel,
    textWidthBasis: textWidthBasis,
    textHeightBehavior: textHeightBehavior,
  );
}