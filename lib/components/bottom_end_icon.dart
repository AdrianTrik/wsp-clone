import 'package:flutter/material.dart';
import '../constants.dart';

class BottomEndIcon extends StatelessWidget {
  final Icon icon;

  BottomEndIcon({@required this.icon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        CircleAvatar(
          backgroundColor: kSelectedTile,
          radius: 12.0,
        ),
        CircleAvatar(
          backgroundColor: kAccentColor,
          child: icon,
          radius: 10.0,
        ),
      ],
    );
  }
}
