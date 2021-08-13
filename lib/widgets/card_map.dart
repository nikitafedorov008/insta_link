import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:insta_link/functions/open_url.dart';
import 'package:line_icons/line_icons.dart';

Widget cardMap(BuildContext context, GlobalKey<GoogleMapStateBase> _key, double lat, double lng, String googleMapsURL, String yandexMapsURL, String yandexTaxiURL) {
  return SizedBox(
    height: 240.0,
    child: Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
          //width: MediaQuery.of(context).size.width / 1.01,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Expanded(
                  flex: 6,
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: GoogleMap(
                        key: _key,
                        markers: {
                          Marker(
                            GeoCoord(59.8261179,30.3450586),
                          ),
                        },
                        initialZoom: 14,
                        initialPosition:
                        GeoCoord(lat,lng),
                        mapType: MapType.roadmap,
                        //mapStyle: _mapStyle,
                        interactive: true,
                        mobilePreferences: const MobileMapPreferences(
                          trafficEnabled: true,
                          zoomControlsEnabled: false,
                        ),
                        webPreferences: WebMapPreferences(
                          fullscreenControl: true,
                          zoomControl: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18.0)),
                      border: Border.all(color: Colors.transparent),
                      color: Colors.white24,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: FlatButton(
                            color: Colors.blue,
                            shape: new RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(14), bottom: Radius.circular(0),),),
                            onPressed: () {
                              openUrlNewTab('https://goo.gl/maps/7RbmSedmx35sB9U86');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                //borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                borderRadius: BorderRadius.vertical(top: Radius.circular(14), bottom: Radius.circular(0),),
                                border: Border.all(color: Colors.transparent),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(EvaIcons.googleOutline),
                                  Text(
                                    'Maps',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FlatButton(
                            color: Colors.red,
                            onPressed: () {
                              openUrlNewTab('https://yandex.ru/maps/-/CCUi4We2XA');
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(LineIcons.yandex),
                                  Text(
                                    'Карты',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: FlatButton(
                            color: Colors.yellow,
                            shape: new RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(0), bottom: Radius.circular(14),),),
                            onPressed: () {
                              openUrlNewTab('https://3.redirect.appmetrica.yandex.com/route?end-lat=59.833249&end-lon=30.349447&ref=&appmetrica_tracking_id=1178268795219780156');
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(LineIcons.yandex),
                                  Text(
                                    'Такси',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}