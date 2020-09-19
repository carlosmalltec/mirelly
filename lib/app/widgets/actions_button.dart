import 'package:flutter/material.dart';

class ActionsButton extends StatelessWidget {
  final String title;
  final Color background;
  final IconData icon;
  final Function onPressed;

  ActionsButton({this.title, this.background, this.icon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      textColor: Colors.white,
      splashColor: Colors.orange,
      elevation: 1,
      color: background,
      height: 25,
      child: Row(
        children: [
          Icon(icon, size: 16,),
          SizedBox(width: 5,),
          Text(title, style: TextStyle(fontSize: 12),),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),),
    );
  }
}
