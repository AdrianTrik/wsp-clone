import 'dart:ui';
import 'package:flutter/material.dart';

final Color kScaffoldBackgroundColor = Color(0xFF111D27);
final Color kPrimaryColor = Color(0xFF232D36);
final Color kDividerColor = Colors.white;
final Color kAccentColor = Color(0xFF00B09C);
final Color kGreyColor = Color(0xFFA1A5AE);
final Color kTextColor = Colors.white;
final Color kViewedColor = Colors.blue;
final Color kMissed = Colors.red;
final Color kSelectedTile = Color(0xFF192229);
final Color kSecondaryButton = Color(0xFF313C42);
final Color kMessageSentColor = Color(0xFF054640);
final Color kWarningColor = Color(0xFFD3C976);

final Widget kIconVideoChatGroup = Stack(
  alignment: AlignmentDirectional.center,
  children: <Widget>[
    Icon(Icons.videocam, size: 29.0),
    Padding(
      padding: EdgeInsets.only(right: 4.0),
      child: Transform.rotate(
        angle: 100,
        child: Icon(
          Icons.link,
          color: kScaffoldBackgroundColor,
          size: 16.0,
        ),
      ),
    ),
  ],
);

final kDefaultOptions = <Widget>[
  Icon(
    Icons.search,
    color: kGreyColor,
  ),
  Padding(
    padding: EdgeInsets.only(left: 20.0, right: 10.0),
    child: Icon(
      Icons.more_vert,
      color: kGreyColor,
    ),
  ),
];
