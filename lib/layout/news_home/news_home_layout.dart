// ignore_for_file: use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_home/cubit/cubit.dart';
import 'package:news/modules/news_app_screens/business_screen.dart';
import 'package:news/modules/news_app_screens/science_screen.dart';
import 'package:news/modules/news_app_screens/sports_screen.dart';
import 'package:news/shear/network/app_cubit/cubit.dart';

import '../../modules/news_app_screens/search_screen.dart';
import '../../shear/styles/icons/icons_broken.dart';
import 'cubit/states.dart';

class homeScreen extends StatelessWidget {
  List<Widget?> screens=[
    businessScreen(),
    sportsScreen(),
    scienceScreen()
  ];
  List<String> titles=[
    'Business News',
    'sports News',
    'science News',
  ];
  @override
  Widget build(BuildContext context) {
  List<Widget?> screens=[
    businessScreen(),
    sportsScreen(),
    scienceScreen()
  ];
  List<String> titles=[
    '( business )',
    '(  sports  )',
    '(  science )',
  ];
    return BlocConsumer<homeCubit,NewsStates>(
      listener: (BuildContext context, Object? state) {  },
      builder: (BuildContext context, state) {
        return Scaffold(
          appBar: AppBar(
            title:Row(
              children: [
                Text('AKHBARY'),
                SizedBox(width: 10,),
                Text('${titles[homeCubit.get(context).currantIndex]}'),


              ],
            ),
            actions: [
              IconButton(
                iconSize: 20,
                  onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => searchScreen(),));
              }, icon:  Icon(Icons.search),),
              IconButton(
                iconSize: 20,
                  onPressed: () {
                    appCubit.get(context).lightness();
              }, icon:  Icon(Icons.light_mode),),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: homeCubit.get(context).currantIndex,
            selectedLabelStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
            selectedIconTheme: IconThemeData(
              size: 25,
            ),
            showUnselectedLabels: true,
            onTap: (index){
              homeCubit.get(context).bottomNavigationBar(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.business_center),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.sports_motorsports_outlined),
                label: 'Sports',
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.science_outlined),
                label: 'Science',
              ),
            ],
          ),
          body: screens[homeCubit.get(context).currantIndex],
        );
      },
    );
  }
}
