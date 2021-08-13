import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'config/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InstaLink',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MainPage(title: 'InstaLink'),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  GlobalKey<GoogleMapStateBase> _key = GlobalKey<GoogleMapStateBase>();

  @override
  Widget build(BuildContext context) {
    return home(context, _key);
  }
}