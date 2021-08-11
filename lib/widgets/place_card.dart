import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'dart:js' as js;

class PlaceCard extends StatefulWidget {
  //const PlaceCard({Key? key}) : super(key: key);
  PlaceCard({this.imageURL, this.title, this.subtitle, this.description, this.link, this.google, this.yandex, this.taxi});

  final String imageURL, title, description, subtitle, link, google, yandex, taxi;

  @override
  _PlaceCardState createState() => _PlaceCardState();
}

class _PlaceCardState extends State<PlaceCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Container(
        height: 500,
        width: 300,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          child: Container(
                            color: Colors.grey,
                            height: 150,
                            width: 400,
                            child: Image.network(widget.imageURL),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            //color: Colors.pinkAccent,
                            gradient: LinearGradient(
                              begin: Alignment(-1, 0),
                              end: Alignment(1, 0),
                              stops: [-1, 1],
                              colors: [
                                Colors.purple,
                                Colors.pinkAccent,
                              ],
                            ),
                          ),
                          child: Text(
                            widget.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22 * MediaQuery.of(context).size.height * 0.001,
                              fontFamily: 'ProductSans',
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Text(widget.subtitle),
                      Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Stack(
                            alignment: Alignment.bottomCenter,
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                                  child: Text(
                                    widget.description,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 18 * MediaQuery.of(context).size.height * 0.001,
                                      fontFamily: 'ProductSans',
                                      //color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: MaterialButton(
                                    minWidth: 90,
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    color: Colors.blue,
                                    onPressed: () {
                                      js.context.callMethod('open', [widget.google]);
                                    },
                                    child: Icon(EvaIcons.googleOutline,)
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    //Container(color: Colors.transparent, height: 200, width: 110,),
                                    FlatButton(
                                        minWidth: 90,
                                        //elevation: 0.0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10.0),
                                        ),
                                        color: Colors.transparent,
                                        onPressed: () {
                                          //share(context, widget.place.toString());
                                        },
                                        child: Icon(Icons.share,)
                                    ),
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: MaterialButton(
                                    minWidth: 90,
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    color: Colors.red,
                                    onPressed: () {
                                      js.context.callMethod('open', [widget.yandex]);
                                    },
                                    child: Icon(LineIcons.yandex,)
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 15,
              child: MaterialButton(
                minWidth: 90,
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.yellow[300],
                onPressed: () {
                  js.context.callMethod('open', [widget.taxi]);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(LineIcons.yandex),
                    Text(
                      'Такси',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'ProductSans',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
