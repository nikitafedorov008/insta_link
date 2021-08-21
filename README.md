
# InstaLink

open source web page template for instagram bio

<img src="images/instalinklogo.png">

## Installation

Install insta_link with git

```bash
  gh repo clone nikitafedorov008/insta_link
```

Open [Google Drive](https://drive.google.com/) and make copy of this [google sheet](https://docs.google.com/spreadsheets/d/1DCruYUrhUqBYsdnBTkyM1kM3br7izfvfyw0wzDQMgOA/edit?usp=sharing)

Open this Google sheet and go to instruments => script editor

write here your Google's sheet id on lines 3 and 36

```bash
  var sheet = SpreadsheetApp.openById("paste your google sheet id here");
```

go to **lib\config\config.dart** and paste your instagram data

```dart
//copy the URL from your instagram photo and paste here
final String instagramPhotoUrl = 'paste here your instagram profile photo url';
//copy the your instagram profile name and paste here
final String instagramProfileName = 'paste here your instagram profile name';
//copy the URL from your instagram photo and paste here
final String instagramProfileTitle = 'paste here your instagram profile title or write some tagline';
```

## Functions

| Name      | Input Type | Description                                        |
| :-------- | :-------   | :--------------------------------------------------|
| `copyToClipboard`      | **string** - text | Copy to clipboard action         |
| `openUrlSameTab`       | **string** - url  | Open URL in the same browser tab |
| `openUrlNewTab`        | **string** - url  | Open URL in the new browser tab  |

## Widgets

For making links to yandex taxi use this [link](https://yandex.ru/dev/taxi/widgets/)

#### topBar

top bar with Instagram information and some buttons

```dart
  topBar(<Widget>[
      //button on the top bar
      topBarButton(
        //button icon
        Icons.add,
        //button title
        'add',
        //button on tap action
        (){
          //open URL in new tab
          copyToClipboard('you copied this text');
        }
      ),
    ]),
```

#### bodyWidget

this is the website body

```dart
  bodyWidget(<Widget>[
      //code here
  ]),
```


#### sectionTitle

title of lower section

```dart
  sectionTitle('Write some text here'/*section name*/),
```
#### cardMap
card with Google Map

```dart
      cardMap(context, _key,
         //coordinates for Map
         59.8261179,30.3450586,
         //URL for Google Maps button
         'paste here google maps url',
         //URL for Yandex Maps button
         'paste here yandex maps url',
         //URL for Yandex Taxi button
         'paste here yandex taxi url'),
```

#### listCardPortrait

list of portrait cards

```dart
      listCardPortrait([
        //portrait card from list
        {
          'imageURL':'paste here some image url',
          'title':'write here some title',
          'subtitle':'write here some subtitle',
          'description':'write here some description',
          'link':'write here some link',
          'google':'write here google maps link',
          'yandex':'write here yandex maps link',
          'taxi':'write here yandex taxi link'
        },
      ]),   
```

#### listCardLandscape

landscape card from list

```dart
      listCardLandscape([
        //landscape card from list
        {
          'imageURL':'paste here some image url',
          'title':'write here some title',
          'subtitle':'write here some subtitle',
          'description':'write here some description',
          'address':'write here some address',
          'link':'write here some link',
          'google':'write here google maps link',
          'yandex':'write here yandex maps link',
          'taxi':'write here yandex taxi link',
        },
      ]),   
```

#### cardWithIcon

card with big icon without image

```dart
      cardWithIcon(
        //icon in the card
        Icon(Icons.airplanemode_on_rounded, color: Colors.purple, size: 32,),
        //card title
        'write here some title',
        //card subtitle
        'write here some subtitle',
        //card on tap action
        (){},
      ),  
```

#### cardForm

card with requisition form

```dart
      cardForm(context),
```


Takes two numbers and returns the sum.


## Useful links

- [Yandex GO Taxi Link Generator](https://yandex.ru/dev/taxi/widgets/)
- [Ubder link maker](https://www.uber.com/ee/ru/ride/)

## Usage/Examples

**lib\config\home.dart**

```dart
import 'package:flutter/material.dart';
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
home(BuildContext context, _key) {
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
      ]),
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
```


## Tech Stack

**Client:** Dart (Flutter)
**Server:** Google Apps Script

## Features

- Google Maps support
- Google Sheet data support

## Feedback

If you have any feedback, please reach out to me at nikitafedorov008@gmail.com


## Lessons Learned

What did you learn while building this project? What challenges did you face and how did you overcome them?


## License

[MIT](https://choosealicense.com/licenses/mit/)

## Roadmap

- Additional browser support

- Add more integrations

- Yandex taxi integration

## Hosting

#### free using GitHub Pages

create web build

```bash
  flutter build web --release
```

create new git

```bash
  git init <project directory>\insta_link\build\web
```

Go to the project directory

```bash
  git add build\web
```

change "/" to your repo name

#### build\web\index.html

```bash
<base href="paste here your repo name">
```

or

```bash
  git add --all 
```

commit and push

```bash
  git commit
  git push
```

after go to your github repo open settings => pages
choose master branch as a source

repo [example](https://github.com/nikitafedorov008/insta_link_example) and  webpage [example](https://nikitafedorov008.github.io/insta_link_example/#/)

## Screenshots

![App Screenshot](https://via.placeholder.com/468x300?text=App+Screenshot+Here)


## Author

- [@nikitafedorov008](https://www.github.com/nikitafedorov008)


## Support

For support, email nikitafedorov008@gmail.com or telegram @nikitafedorov008.

  