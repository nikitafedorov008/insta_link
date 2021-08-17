import 'package:flutter/material.dart';
import 'dialog_card.dart';

//big portrait card with image
Widget cardPortrait(BuildContext context, String imageURL, String title, String subtitle, String description, String link, String google, String yandex, String taxi) {
  return GestureDetector(
    onTap: () {
      //js.context.callMethod('open', [link]);
      dialogCardWidget(context, imageURL, title, subtitle, description, link, google, yandex, taxi,);
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