// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webScreen extends StatelessWidget {
  final String url;

  webScreen({super.key, required this.url});
  @override
  Widget build(BuildContext context) {
    var controller = TextEditingController(text: '$url');
   return Scaffold(
     appBar: AppBar(
       title: TextFormField(
         onFieldSubmitted: (value) => Navigator.push(context, MaterialPageRoute(builder: (context) => webScreen(url: controller.text),)),
         controller: controller,
         decoration: InputDecoration(
          border: InputBorder.none,
         ),
       ),
     ),
     body: WebView(
       initialUrl: url,
     ),
   );
  }
}
