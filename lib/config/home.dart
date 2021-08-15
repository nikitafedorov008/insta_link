import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../functions/copy_clipboard.dart';
import '../functions/open_url.dart';
import '../widgets/bodyWidget.dart';
import '../widgets/card_map.dart';
import '../widgets/card_with_icon.dart';
import '../widgets/form_widget.dart';
import '../widgets/info_fab.dart';
import '../widgets/list_card_landscape.dart';
import '../widgets/list_card_portrait.dart';
import '../widgets/section_title.dart';
import '../widgets/top_bar.dart';
import 'dart:js' as js;

//This is insta_link main page, where are all the widgets displayed on the screen
Widget home(BuildContext context, _key) {
  return Scaffold(
    //top bar with Instagram information and some buttons
    appBar: topBar(<Widget>[
      //button on the top bar
      topBarButton(
        //button icon
        Icons.email_outlined,
        //button title
        'email',
        //button on tap action
        (){
          //copy to clipboard action
          copyToClipboard('davranova.yana@yandex.ru');
        }
      ),
      //button on the top bar
      topBarButton(
        //button icon
        Icons.phone_enabled_outlined,
        //button title
        'позвонить',
        //button on tap action
        (){
          //open URL in new tab
          openUrlNewTab('tel:+79119257931');
        }
      ),
      //button on the top bar
      topBarButton(
        //button icon
        LineIcons.telegram,
        //button title
        'telegram',
        //button on tap action
        (){
          //open URL in new tab
          //openUrlNewTab('tel:+79119257931');
        }
      ),
      //button on the top bar
      topBarButton(
        //button icon
        LineIcons.whatSApp,
        //button title
        'whatsapp',
        //button on tap action
        (){
          //open URL in new tab
          openUrlNewTab('https://api.whatsapp.com/send/?phone=79119257931&text&app_absent=0');
        }
      ),
    ]),
    //this is the website body
    body: bodyWidget(<Widget>[
      //title of lower section
      sectionTitle('Карта & маршрут'/*section name*/),
      //card with Google Map
      cardMap(context, _key,
          //coordinates for Map
          59.8261179,30.3450586,
          //URL for Google Maps button
          'https://goo.gl/maps/7RbmSedmx35sB9U86',
          //URL for Yandex Maps button
          'https://yandex.ru/maps/-/CCUi4We2XA',
          //URL for Yandex Taxi button
          'https://3.redirect.appmetrica.yandex.com/route?end-lat=59.833249&end-lon=30.349447&ref=&appmetrica_tracking_id=1178268795219780156'),
      //title of lower section
      sectionTitle('Популярные маршруты'),
      //list of portrait cards
      listCardPortrait([
        //portrait card from list
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
        //portrait card from list
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
        //portrait card from list
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
        //portrait card from list
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
        //portrait card from list
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
        //portrait card from list
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
      //title of lower section
      sectionTitle('Популярные кафе & рестораны'),
      //list of landscape cards
      listCardLandscape([
        //landscape card from list
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
        //landscape card from list
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
        //landscape card from list
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
        //landscape card from list
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
      //title of lower section
      sectionTitle('Другие места'),
      //card with big icon without image
      cardWithIcon(
        //icon in the card
        Icon(Icons.airplanemode_on_rounded, color: Colors.purple, size: 32,),
        //card title
        'Аэропорт Пулково',
        //card subtitle
        '12 минут на авто до аппартаментов',
        //card on tap action
        (){},
      ),
      //card with big icon without image
      cardWithIcon(
        //icon in the card
        Icon(Icons.subway, color: Colors.blue, size: 32,),
        //card title
        'Метро Звездная',
        //card subtitle
        '5 минут до метро от аппартаментов',
        //card on tap action
        (){},
      ),
      //card with big icon without image
      cardWithIcon(
        //icon in the card
        Icon(Icons.airport_shuttle_rounded, color: Colors.amber, size: 32,),
        //card title
        'Автобус',
        //card subtitle
        'ближайший автобус ходит под номером 141',
        //card on tap action
        (){},
      ),
      //card with big icon without image
      cardWithIcon(
        //icon in the card
        Icon(Icons.add_road_rounded, color: Colors.red, size: 32,),
        //card title
        'КАД',
        //card subtitle
        '7 минут до КАДа на автомобиле',
        //card on tap action
        (){},
      ),
      //title of lower section
      sectionTitle('Бронирование'),
      //card with big icon without image
      cardWithIcon(
        //icon in the card
        Icon(LineIcons.airbnb, color: Colors.red, size: 32,),
        //card title
        'Зарброниовать на Airbnb',
        //card subtitle
        'просто кликните сюда',
        //card on tap action
        (){
          //open URL in new browser tab
          openUrlNewTab('https://abnb.me/dIBscInhshb');
        },
      ),
      //card with big icon without image
      cardWithIcon(
        //icon in the card
        Icon(EvaIcons.book, color: Colors.blue, size: 32,),
        //card title
        'Зарброниовать на Booking.com',
        //card subtitle
        'Оценка - 9,8 💣',
        //card on tap action
        (){
          //open URL in new browser tab
          openUrlNewTab('http://www.booking.com/Share-zPPvvK');
        },
      ),
      //card with requisition form
      cardForm(context),
    ],),
      //floating action button with business information
      floatingActionButton: infoFab(context,
        //text on the button
        'доп. информация',
        //name of the business
        'ИП Давранова Яна Алефтиновна',
        //information about business
        'ОГРНИП 318784700371421\nИНН 780217152633\nтелефон +7 911 925-79-31',
      ),
  );
}