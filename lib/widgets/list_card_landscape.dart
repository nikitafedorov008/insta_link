import 'package:flutter/material.dart';

import 'card_landscape.dart';

//widget with list of landscape cards
Widget listCardLandscape(List<Map<String, dynamic>> data){
  return SizedBox(
    height: 100.0,
    child: ListView.builder(
      physics: ClampingScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index)=> cardLandscape(
        context,
        data[index]['imageURL'],
        data[index]['title'],
        data[index]['subtitle'],
        data[index]['description'],
        data[index]['address'],
        data[index]['link'],
        data[index]['google'],
        data[index]['yandex'],
        data[index]['taxi'],
      ),
      itemCount: data.length,
    ),
  );
}