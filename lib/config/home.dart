import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import '../functions/copy_clipboard.dart';
import '../functions/open_url.dart';
import '../widgets/bodyWidget.dart';
import '../widgets/card_map.dart';
import '../widgets/card_with_icon.dart';
import '../widgets/create_requisition_widget.dart';
import '../widgets/info_fab.dart';
import '../widgets/list_card_landscape.dart';
import '../widgets/list_card_portrait.dart';
import '../widgets/section_title.dart';
import '../widgets/top_bar.dart';
import 'dart:js' as js;

Widget home(BuildContext context, _key) {
  return Scaffold(
    appBar: topBar(<Widget>[
      topBarButton(
          Icons.email_outlined,
          'email',
              (){
            copyToClipboard('davranova.yana@yandex.ru');
          }
      ),
      topBarButton(
          Icons.phone_enabled_outlined,
          'позвонить',
              (){
            openUrlNewTab('tel:+79119257931');
          }
      ),
      topBarButton(
          LineIcons.telegram,
          'telegram',
              (){
            //openUrlNewTab('tel:+79119257931');
          }
      ),
      topBarButton(
          LineIcons.whatSApp,
          'whatsapp',
              (){
            openUrlNewTab('https://api.whatsapp.com/send/?phone=79119257931&text&app_absent=0');
          }
      ),
    ]),
    body: bodyWidget(<Widget>[
      sectionTitle('Карта & маршрут'),
      cardMap(context, _key,
          59.8261179,30.3450586,
          'https://goo.gl/maps/7RbmSedmx35sB9U86',
          'https://yandex.ru/maps/-/CCUi4We2XA',
          'https://3.redirect.appmetrica.yandex.com/route?end-lat=59.833249&end-lon=30.349447&ref=&appmetrica_tracking_id=1178268795219780156'),
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
          child: CreateRequisitionWidget(),
        ),
      ),
    ],),
      floatingActionButton: infoFab(context,
        'доп. информация', 'ИП Давранова Яна Алефтиновна',
        'ОГРНИП 318784700371421\nИНН 780217152633\nтелефон +7 911 925-79-31',
      ),
  );
}