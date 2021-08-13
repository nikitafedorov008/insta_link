import 'package:flutter/material.dart';
import 'package:insta_link/config/config.dart';
import 'dart:js' as js;
import 'package:line_icons/line_icons.dart';

Widget topBar(List<Widget> tapBarButtons,) {

  return AppBar(
    toolbarHeight: 240,
    centerTitle: true,
    title: GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18.0)),
          border: Border.all(color: Colors.transparent),
          color: Colors.white24,
        ),
        padding: EdgeInsets.fromLTRB(8,8,8,8,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              minRadius: 40,
              backgroundColor: Colors.white10,
              backgroundImage: NetworkImage(instagramPhotoUrl),
            ),
            Text(instagramProfileName,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),
            Text(instagramProfileTitle,
              style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'ProductSans',
                  fontWeight: FontWeight.w500,
                  color: Colors.white
              ),
            ),
          ],
        ),
      ),
    ),
    /*
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
        */
    flexibleSpace: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
          colors: <Color>[
            Colors.purple[600],
            Colors.pink,
            Colors.yellow[100],
          ],
        ),
      ),
    ),
    bottom: PreferredSize(
      child: Container(
        //color: Colors.grey[100],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: tapBarButtons,
            ),
          ],
        ),
      ),
      preferredSize: Size(128, 120),
    ),
  );
}

Widget tapBarButton(IconData icon, String title, onPressed){
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Column(
      children: [
        RawMaterialButton(
          onPressed: () {
            //js.context.callMethod('open', ['davranova.yana@yandex.ru']);
            onPressed();
          },
          elevation: 2.0,
          fillColor: Colors.white,
          child: Icon(
            icon,
            color: Colors.pinkAccent,
            size: 24.0,
          ),
          padding: EdgeInsets.all(12.0),
          shape: CircleBorder(),
        ),
        SizedBox(height: 4,),
        Text(title, style: TextStyle(color: Colors.pinkAccent),),
      ],
    ),
  );
}