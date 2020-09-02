import 'package:flutter/material.dart';

class CustomImageAvatar extends StatelessWidget {
  final Widget bottomEndIcon;
  final String imgSrc;

  CustomImageAvatar({this.bottomEndIcon, @required this.imgSrc});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 7.0, bottom: 5.0),
          child: CircleAvatar(
            backgroundImage: AssetImage(imgSrc),
            radius: 25.0,
          ),
        ),
        bottomEndIcon ?? SizedBox(),
      ],
    );
  }
}
