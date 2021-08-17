import 'package:flutter/material.dart';

//card with icon without image
Widget cardWithIcon(Icon icon, String title, String subtitle, onTap){
  return Card(
    child: ListTile(
      leading: icon,
      title: Text(title),
      subtitle: Text(subtitle),
      onTap: onTap,
    ),
  );
}