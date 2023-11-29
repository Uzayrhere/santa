import 'package:flutter/material.dart';

poppins(
    {double? fontSize,
    color,
    fontWeight,
    double? latterSpacing,
    TextOverflow dot = TextOverflow.visible}) {
  return TextStyle(
    overflow: dot,
    fontSize: fontSize ?? 18,
    color: color ?? Colors.white,
    fontWeight: fontWeight ?? FontWeight.w500,
    letterSpacing: latterSpacing ?? 1,
  );
}
