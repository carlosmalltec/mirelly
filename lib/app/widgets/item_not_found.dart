import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemNotFound extends StatelessWidget {
  String text;
  String icon;
  ItemNotFound({this.text, this.icon});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - MediaQuery.of(context).size.height / 3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SvgPicture.asset(
            icon,
            height: 46.0,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Theme.of(context).accentColor
            ),
          ),
        ],
      ),
    );
  }
}
