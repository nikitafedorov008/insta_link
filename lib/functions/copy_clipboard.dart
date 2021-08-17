import 'package:flutter/services.dart';

//copy to clipboard action
void copyToClipboard(String text){
  Clipboard.setData(ClipboardData(text: text));
}