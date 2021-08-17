import 'dart:js' as js;
import 'dart:html' as html;

//open URL in the same browser tab
void openUrlSameTab(String url) {
  html.window.open(url,"_self");
}

//open URL in the new browser tab
void openUrlNewTab(String url) {
  js.context.callMethod('open', [url]);
}