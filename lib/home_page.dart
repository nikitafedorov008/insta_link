import 'package:date_ranger/date_ranger.dart';
import 'package:easy_web_view/easy_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_maps/flutter_google_maps.dart';
import 'package:insta_link/create_item_page.dart';
import 'package:insta_link/database_page.dart';
import 'package:insta_link/widgets/place_card.dart';
import 'package:insta_public_api/insta_public_api.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:speed_dial_fab/speed_dial_fab.dart';
import 'dart:js' as js;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String text = '';

  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
    instaInfo();
  }


  instaInfo() async {
    final ipa = InstaPublicApi('apartzvezdnaya');

// Get info like Full Name, Followers, Following etc
    final info = await ipa.getBasicInfo();

    setState(() {
      text = '${info.bio}';
    });
    print('Posts: ${info.noOfPosts}');
    print('Followers: ${info.followers}');
    print('Following: ${info.following}');
  }

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

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              'Все',
              style: TextStyle(
                color: Colors.transparent,
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardPortrait(String imageURL, String title, String subtitle, String description, String link, String google, String yandex, String taxi) {
    return GestureDetector(
      onTap: () {
        //js.context.callMethod('open', [link]);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                backgroundColor: Colors.transparent,
                child: PlaceCard(imageURL: imageURL, title: title, subtitle: subtitle, description: description, link: link, google: google, yandex: yandex, taxi: taxi,),
              );
            }
        );
        /*
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              child: EasyWebView(
                src: link,
                isHtml: false, // Use Html syntax
                isMarkdown: false, // Use markdown syntax
                convertToWidgets: false,
                widgetsTextSelectable: false,
                webAllowFullScreen: false,
                onLoaded: () {
                  print('$title: Loaded: $link');
                },
              ),
            );
          },
        );
        */
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                    imageURL,
                    width: 150,
                    height: 120,
                    fit:BoxFit.fill

                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardLandscape(String imageURL, String title, String subtitle, String description, String address, String link, String google, String yandex, String taxi,) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: GestureDetector(
        onTap: () {
          //js.context.callMethod('open', [link]);
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  backgroundColor: Colors.transparent,
                  child: PlaceCard(imageURL: imageURL, title: title, subtitle: subtitle, description: description, link: link, google: google, yandex: yandex, taxi: taxi,),
                );
              }
          );
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                      imageURL,
                      width: 100,
                      height: 90,
                      fit:BoxFit.fill

                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.star_rate_rounded, color: Colors.grey, size: 14,),
                        Text(
                          subtitle,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        Icon(Icons.attach_money_rounded, color: Colors.grey, size: 14,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      address,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listCardPortrait(List<Map<String, dynamic>> data){
    return SizedBox(
      height: 186.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index)=> cardPortrait(
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
  Widget listCardLandscape(List<Map<String, dynamic>> data){
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index)=> cardLandscape(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  backgroundImage: NetworkImage('https://cf.bstatic.com/xdata/images/hotel/max1024x768/281601248.jpg?k=222547ea22eca07e2e401238a89361e1181b4db0350d8b359f596d4872e6e4ca&o=&hp=1'),
                ),
                Text("apartzvezdnaya",
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'ProductSans',
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),
                ),
                Text("Наши гости чувствуют себя как дома, только ЛУЧШЕ!",
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
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              js.context.callMethod('open', ['davranova.yana@yandex.ru']);
                            },
                            elevation: 2.0,
                            fillColor: Colors.white,
                            child: Icon(
                              Icons.email_outlined,
                              color: Colors.pinkAccent,
                              size: 24.0,
                            ),
                            padding: EdgeInsets.all(12.0),
                            shape: CircleBorder(),
                          ),
                          SizedBox(height: 4,),
                          Text('email', style: TextStyle(color: Colors.pinkAccent),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              js.context.callMethod('open', ['tel:+79119257931']);
                            },
                            elevation: 2.0,
                            fillColor: Colors.white,
                            child: Icon(
                              Icons.phone_enabled_outlined,
                              color: Colors.pinkAccent,
                              size: 24.0,
                            ),
                            padding: EdgeInsets.all(12.0),
                            shape: CircleBorder(),
                          ),
                          SizedBox(height: 4,),
                          Text('позвонить', style: TextStyle(color: Colors.pinkAccent),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        children: [
                          RawMaterialButton(
                            onPressed: () {},
                            elevation: 2.0,
                            fillColor: Colors.white,
                            child: Icon(
                              LineIcons.telegram,
                              color: Colors.pinkAccent,
                              size: 24.0,
                            ),
                            padding: EdgeInsets.all(12.0),
                            shape: CircleBorder(),
                          ),
                          SizedBox(height: 4,),
                          Text('telegram', style: TextStyle(color: Colors.pinkAccent),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Column(
                        children: [
                          RawMaterialButton(
                            onPressed: () {
                              js.context.callMethod('open', ['https://api.whatsapp.com/send/?phone=79119257931&text&app_absent=0']);
                            },
                            elevation: 2.0,
                            fillColor: Colors.white,
                            child: Icon(
                              LineIcons.whatSApp,
                              color: Colors.pinkAccent,
                              size: 24.0,
                            ),
                            padding: EdgeInsets.all(12.0),
                            shape: CircleBorder(),
                          ),
                          SizedBox(height: 4,),
                          Text('whatsapp', style: TextStyle(color: Colors.pinkAccent),),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          preferredSize: Size(128, 120),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      'Карта & маршрут',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Text(
                      'Все',
                      style: TextStyle(
                        color: Colors.transparent,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
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
                                  GeoCoord(59.8261179,30.3450586), // Los Angeles, CA
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
                                        //TODO google maps link
                                        js.context.callMethod('open', ['https://goo.gl/maps/7RbmSedmx35sB9U86']);
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
                                        //TODO yandex maps link
                                        js.context.callMethod('open', ['https://yandex.ru/maps/-/CCUi4We2XA']);
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
                                        js.context.callMethod('open', ['https://3.redirect.appmetrica.yandex.com/route?end-lat=59.833249&end-lon=30.349447&ref=&appmetrica_tracking_id=1178268795219780156']);
                                      },
                                      child: Container(
                                        /*decoration: BoxDecoration(
                                          //borderRadius: BorderRadius.all(Radius.circular(18.0)),
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(0), bottom: Radius.circular(14),),
                                          border: Border.all(color: Colors.transparent),
                                          color: Colors.yellow,
                                        ),*/
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
            ),
            sectionTitle('Популярные маршруты'),
            listCardPortrait([
              {
                'imageURL':'https://upload.wikimedia.org/wikipedia/commons/a/ac/Park_Pobedy_SPB_3.jpg',
                'title':'Парк победы',
                'subtitle':'Отдых',
                'description':'description',
                'link':'https://goo.gl/maps/afag26AEptGTdUo28',
                'google':'google',
                'yandex':'yandex',
                'taxi':'taxi'
              },
              {
                'imageURL':'https://lh5.googleusercontent.com/p/AF1QipN0oODKlAEPu-of7yfhR4vfMN27iV5xc25FsRhi=w464-h260-n-k-no',
                'title':'Люмьер-Холл',
                'subtitle':'Исскуство',
                'description':'description',
                'link':'https://goo.gl/maps/DwZLvJdA7gLH9D5aA',
                'google':'google',
                'yandex':'yandex',
                'taxi':'taxi'
              },
              {
                'imageURL':'https://lh5.googleusercontent.com/p/AF1QipNobsx6BZr9s3QWZIqyL-qydZUKhEeMiKidDu1-=w464-h260-n-k-no',
                'title':'Парк "Россия"',
                'subtitle':'Мультимедийный парк',
                'description':'description',
                'link':'https://goo.gl/maps/WbbV2UCxyQb6Q8su9',
                'google':'google',
                'yandex':'yandex',
                'taxi':'taxi'
              },
              {
                'imageURL':'https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcRuWo446Y02BaaZd7jMn40WND821MdQTY-kN7eL6ky4MUt6cKnlCJHYaS-gICYr9k--0wTUP2Y0KUItHloaE86pmA',
                'title':'Обсерватория',
                'subtitle':'Наука',
                'description':'description',
                'link':'https://goo.gl/maps/EPQFMwsrwptfwpFR9',
                'google':'google',
                'yandex':'yandex',
                'taxi':'taxi'
              },
              {
                'imageURL':'https://lh5.googleusercontent.com/p/AF1QipO31DuOKcdEUojlZknrCorjJUZVz3RNrr4OhPN7=w426-h240-k-no',
                'title':'Гранд Макет Росси',
                'subtitle':'Отдых',
                'description':'description',
                'link':'https://goo.gl/maps/spAYmNqo4vdyztXU9',
                'google':'google',
                'yandex':'yandex',
                'taxi':'taxi'
              },
              {
                'imageURL':'https://encrypted-tbn3.gstatic.com/licensed-image?q=tbn:ANd9GcQCU-ukakMsgcb_lhRhWojO_xTyLhEMjxIoBAo69G_xCxzadKxIUJGJVIrbR9MdCy5GHOqmBqLCs7J4qmmnQy6eLQ',
                'title':'"Чесменская ерковь',
                'subtitle':'культура',
                'description':'description',
                'link':'https://goo.gl/maps/q1aCDy925rkpB1Rt5',
                'google':'google',
                'yandex':'yandex',
                'taxi':'taxi'
              },
            ]),
            sectionTitle('Популярные кафе & рестораны'),
            listCardLandscape([
              {
                'imageURL':'https://lh5.googleusercontent.com/p/AF1QipNrTYC8ELTncOaLXICedJtWQISy2CNTGUqyM_HR=w408-h276-k-no',
                'title':'Пхали-Хинкали',
                'subtitle':'4.7 - restaurant -',
                'description':'description',
                'address':'пр. Юрия Гагарина, 71',
                'link':'https://goo.gl/maps/47eBHSwKn79VqB2T8',
                'google':'google',
                'yandex':'yandex',
                'taxi':'taxi',
              },
              {
                'imageURL':'https://lh5.googleusercontent.com/p/AF1QipNwhzs6JkVgGmjHkrqAUzfzCwIxws9DOfb0pJjv=w408-h272-k-no',
                'title':'PAR',
                'subtitle':'4.6 - restaurant -',
                'description':'description',
                'address':'пр. Юрия Гагарина, 75',
                'link':'https://g.page/Par-Restaraunt?share',
                'google':'google',
                'yandex':'yandex',
                'taxi':'taxi',
              },
              {
                'imageURL':'https://lh5.googleusercontent.com/p/AF1QipM-Z89XQXFtCt7bTOh7TDnNb7Dinmo0FPXu7ZUK=w415-h240-k-no',
                'title':'OTTO',
                'subtitle':'4.7 - restaurant -',
                'description':'description',
                'address':'пр. Космонавтов, д. 63 к.1',
                'link':'https://g.page/otto-zv?share',
                'google':'google',
                'yandex':'yandex',
                'taxi':'taxi',
              },
              {
                'imageURL':'https://lh5.googleusercontent.com/p/AF1QipMMSAO3LdtPJvjk5m20BAk5BD1nZlSlgzQp5tPj=w408-h306-k-no',
                'title':'Лаундж кафе WINGS',
                'subtitle':'4.7 - restaurant -',
                'description':'description',
                'address':'Пулковское ш., 38/8',
                'link':'https://goo.gl/maps/NMRfYbg9o5ZYXDd4A',
                'google':'google',
                'yandex':'yandex',
                'taxi':'taxi',
              },
            ]),
            sectionTitle('Другие места'),
            cardWithIcon(
              Icon(Icons.airplanemode_on_rounded, color: Colors.purple, size: 32,),
              'Аэропорт Пулково',
              '12 минут на авто до аппартаментов',
              (){},
            ),
            cardWithIcon(
              Icon(Icons.subway, color: Colors.blue, size: 32,),
              'Метро Звездная',
              '5 минут до метро от аппартаментов',
              (){},
            ),
            cardWithIcon(
              Icon(Icons.airport_shuttle_rounded, color: Colors.amber, size: 32,),
              'Автобус',
              'ближайший автобус ходит под номером 141',
              (){},
            ),
            cardWithIcon(
              Icon(Icons.add_road_rounded, color: Colors.red, size: 32,),
              'КАД',
              '7 минут до КАДа на автомобиле',
              (){},
            ),
            sectionTitle('Бронирование'),
            cardWithIcon(
              Icon(LineIcons.airbnb, color: Colors.red, size: 32,),
              'Зарброниовать на Airbnb',
              'просто кликните сюда',
              (){js.context.callMethod('open', ['https://abnb.me/dIBscInhshb']);},
            ),
            cardWithIcon(
              Icon(EvaIcons.book, color: Colors.blue, size: 32,),
              'Зарброниовать на Booking.com',
              'Оценка - 9,8 💣',
               (){js.context.callMethod('open', ['http://www.booking.com/Share-zPPvvK']);},
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: Container(
                height: 930,
                width: MediaQuery.of(context).size.width,
                child: CreateItemPage(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pinkAccent,
        icon: Icon(Icons.info),
        label: Text('доп. информация'),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('ИП Давранова Яна Алефтиновна'),
                  content: Text('ОГРНИП 318784700371421\nИНН 780217152633\nтелефон +7 911 925-79-31'),
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
      ),
    );
  }
  GlobalKey<GoogleMapStateBase> _key = GlobalKey<GoogleMapStateBase>();

}