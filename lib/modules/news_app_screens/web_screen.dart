import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webScreen extends StatelessWidget {
  final String url;

  webScreen({super.key, required this.url});
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(),
     body: WebView(
       initialUrl: url,
     ),
   );
  }
}
