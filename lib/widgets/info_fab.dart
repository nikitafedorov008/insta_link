import 'package:flutter/material.dart';

import '../database_page.dart';

Widget infoFab(BuildContext context, String buttonName, String businessName, String businessInfo) {
  return FloatingActionButton.extended(
    backgroundColor: Colors.pinkAccent,
    icon: Icon(Icons.info),
    label: Text(buttonName),
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(businessName),
            content: Text(businessInfo),
            actions: [
              TextButton(
                child: Text('admin', style: TextStyle(color: Colors.black12),),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DatabaseMobileScreen()),
                  );
                },
              ),
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
  );
}