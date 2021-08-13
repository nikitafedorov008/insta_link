import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bodyWidget(List<Widget> body) {
  return SingleChildScrollView(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: body,
    ),
  );
}