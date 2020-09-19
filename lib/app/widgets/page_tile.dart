import 'package:flutter/material.dart';

class PageTile extends StatelessWidget {
  final String label;
  final IconData iconData;
  final VoidCallback onTab;
  final bool highlight;

  PageTile({this.label, this.iconData, this.onTab, this.highlight});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label, style: TextStyle(color: highlight ? Theme.of(context).primaryColor : Theme.of(context).accentColor, fontWeight: highlight ? FontWeight.w600 : FontWeight.normal),),
      leading: Icon(iconData, color: highlight ? Theme.of(context).primaryColor : Theme.of(context).accentColor,),
      onTap: onTab,

    );
  }
}
