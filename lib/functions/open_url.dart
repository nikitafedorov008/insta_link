import 'dart:js' as js;
import 'dart:html' as html;

void openUrlSameTab(String url) {
  html.window.open(url,"_self");
}

void openUrlNewTab(String url) {
  js.context.callMethod('open', [url]);
}