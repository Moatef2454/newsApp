import 'package:flutter/material.dart';

import '../../modules/news_app_screens/web_screen.dart';

Widget? NewsItemBuilder(article,context)=>InkWell(
  onTap: () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => webScreen(url:'${article['url']}'),));
  },
  child: Padding(
    padding: const EdgeInsets.only(
      top: 10,
      left: 7,
      right: 7,
    ),
    child: Container(
      height: 100,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadiusDirectional.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            child: Image(
              image: article['urlToImage']!=null?NetworkImage('${article['urlToImage']}'):NetworkImage('https://th.bing.com/th/id/OIP.6kEev2FT9fMgGqWhNJSfPgHaE6?pid=ImgDet&rs=1'),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8,),
          Expanded
            (child: Container(
            padding: EdgeInsetsDirectional.only(
                top: 15,
                end: 10
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${article['title']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 10,),
                Text('${article['publishedAt']}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.caption!.copyWith(
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    ),
  ),
);
Widget lightnessIcon=Icon(Icons.nightlight_outlined);
