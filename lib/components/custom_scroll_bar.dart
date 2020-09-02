import 'package:flutter/material.dart';
import 'package:wsp_clone/constants.dart';

class CustomScrollBar extends StatelessWidget {
  final Widget child;

  CustomScrollBar({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        Scrollbar(child: child),
        Container(
          width: 3,
          color: kScaffoldBackgroundColor,
        ),
      ],
    );
  }
}
