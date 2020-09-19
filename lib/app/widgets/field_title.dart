import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  final String title;
  final String subtitle;
  FieldTitle({this.title,this.subtitle});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.only(left: 3,bottom: 4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            '$title ',
            style: TextStyle(
                fontSize: 16.0,
                color: Theme.of(context).accentColor,
              fontWeight: FontWeight.w700
            ),
          ),
          Text(
            '$subtitle',
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
