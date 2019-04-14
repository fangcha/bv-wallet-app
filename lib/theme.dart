import 'package:flutter/material.dart';

const BvYellow = const Color(0xFFFDC328);
const BvYellowLight = const Color(0xFFFFF560);
const BvYellowDark = const Color(0xFFC59300);

const BvGrey = const Color(0xFF424242);
const BvGreyLight = const Color(0xFF6D6D6D);
const BvGreyDark = const Color(0xFF1B1B1B);

const PrimaryTextColor = const Color(0xFF212121);
const SecondaryTextColor = Colors.white;
const BvErrorRed = Color(0xFFC5032B);

final ThemeData theme = _buildBvTheme();

ThemeData _buildBvTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: BvGreyDark,
    primaryColor: BvYellow,
    buttonTheme: base.buttonTheme
        .copyWith(buttonColor: BvGrey, textTheme: ButtonTextTheme.normal),
    scaffoldBackgroundColor: Colors.white,
    cardColor: Colors.white,
    textSelectionColor: BvYellow,
    errorColor: BvErrorRed,
    textTheme: _buildBvTextTheme(base.textTheme),
    primaryTextTheme: _buildBvTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildBvTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(color: BvGrey),
  );
}

TextTheme _buildBvTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline: base.headline.copyWith(
          fontWeight: FontWeight.w500,
        ),
        title: base.title.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
      )
      .apply(
        fontFamily: 'Hero',
        displayColor: PrimaryTextColor,
        bodyColor: PrimaryTextColor,
      );
}
