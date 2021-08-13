import 'package:flutter/material.dart';

import 'card_portrait.dart';

Widget listCardPortrait(List<Map<String, dynamic>> data){
  return SizedBox(
    height: 186.0,
    child: ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index)=> cardPortrait(
        context,
        data[index]['imageURL'],
        data[index]['title'],
        data[index]['subtitle'],
        data[index]['description'],
        data[index]['link'],
        data[index]['google'],
        data[index]['yandex'],
        data[index]['taxi'],
      ),
      itemCount: data.length,
    ),
  );
}