import 'package:flutter/material.dart';

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