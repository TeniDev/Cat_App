import 'package:flutter/material.dart';

class _Size {
  double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double fullHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double width(BuildContext context, double value) {
    return fullWidth(context) * value;
  }

  double height(BuildContext context, double value) {
    return fullHeight(context) * value;
  }

  EdgeInsets fromLTRB(
    BuildContext context,
    double left,
    double top,
    double right,
    double bottom,
  ) {
    return EdgeInsets.fromLTRB(
      fullWidth(context) * left,
      fullWidth(context) * top,
      fullWidth(context) * right,
      fullWidth(context) * bottom,
    );
  }

  EdgeInsets symmetric(
    BuildContext context,
    double horizontal,
    double vertical,
  ) {
    return EdgeInsets.symmetric(
      vertical: fullWidth(context) * vertical,
      horizontal: fullWidth(context) * horizontal,
    );
  }

  EdgeInsets all(BuildContext context, double value) {
    return EdgeInsets.all(
      fullWidth(context) * value,
    );
  }

  EdgeInsets horizontal(BuildContext context, double value) {
    return EdgeInsets.symmetric(
      horizontal: fullWidth(context) * value,
    );
  }

  EdgeInsets vertical(BuildContext context, double value) {
    return EdgeInsets.symmetric(
      vertical: fullWidth(context) * value,
    );
  }

  EdgeInsets top(BuildContext context, double value) {
    return EdgeInsets.only(
      top: fullWidth(context) * value,
    );
  }

  EdgeInsets left(BuildContext context, double value) {
    return EdgeInsets.only(
      left: fullWidth(context) * value,
    );
  }

  EdgeInsets right(BuildContext context, double value) {
    return EdgeInsets.only(
      right: fullWidth(context) * value,
    );
  }

  EdgeInsets bottom(BuildContext context, double value) {
    return EdgeInsets.only(
      bottom: fullWidth(context) * value,
    );
  }

  BorderRadius borderRadius(BuildContext context, double radius) {
    return BorderRadius.all(Radius.circular(fullWidth(context) * radius));
  }
}

final size = _Size();
