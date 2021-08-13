import 'package:flutter/material.dart';

import 'dialog_card.dart';

Widget cardLandscape(BuildContext context, String imageURL, String title, String subtitle, String description, String address, String link, String google, String yandex, String taxi,) {
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
                child: DialogCard(imageURL: imageURL, title: title, subtitle: subtitle, description: description, link: link, google: google, yandex: yandex, taxi: taxi,),
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