// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/layout/news_home/cubit/cubit.dart';
import 'package:news/modules/news_app_screens/business_screen.dart';
import 'package:news/shear/bloc_observer/bloc_obsorver.dart';
import 'package:news/shear/network/app_cubit/cubit.dart';
import 'package:news/shear/network/app_cubit/states.dart';
import 'package:news/shear/network/local/cash_helper.dart';
import 'package:news/shear/network/remote/dio_helper.dart';

import 'layout/news_home/cubit/states.dart';
import 'layout/news_home/news_home_layout.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized();
DioHelper.init();
await CashHelper.int();
Bloc.observer=SimpleBlocObserver();
var dark = CashHelper.getbool(key: 'isDark');
  runApp(MyApp( isDark: dark,));
}

class MyApp extends StatelessWidget {
  final bool? isDark;
  MyApp({super.key,  this.isDark});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => appCubit()..lightness(fromShared: isDark)),
        BlocProvider(
            create: (context) => homeCubit()..getBusinessNews()..lightness(fromShared: isDark),),
      ],
      child: BlocConsumer<appCubit,appStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) =>MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.amber,
              textTheme: TextTheme(
                  titleMedium: TextStyle(
                      color: Colors.black
                  )
              ),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Colors.amber),
              elevation: 0,

            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              unselectedItemColor: Colors.black.withOpacity(.5),
              elevation: 0,
              backgroundColor: Colors.white
            )

          ),
          darkTheme: ThemeData(
              primarySwatch: Colors.cyan,
              appBarTheme: AppBarTheme(
              color: HexColor('333739'),
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.cyan),
                titleTextStyle: TextStyle(color: Colors.white70,fontSize: 20)
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: HexColor('333740'),
              unselectedItemColor: Colors.grey,
            ),
            scaffoldBackgroundColor: HexColor('333739'),
            textTheme: TextTheme(
              titleMedium: TextStyle(
                color: Colors.white
              )
            )
          ),
          themeMode: appCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home:homeScreen(),
        ),
      ),
    );
  }
}
