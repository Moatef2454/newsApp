// ignore_for_file: curly_braces_in_flow_control_structures, prefer_conditional_assignment

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_home/cubit/states.dart';
import 'package:news/shear/network/app_cubit/states.dart';
import 'package:news/shear/network/local/cash_helper.dart';
import 'package:news/shear/network/remote/dio_helper.dart';

class appCubit extends Cubit<appStates>{
  appCubit():super(appInitialState());
  static appCubit get(context)=>BlocProvider.of(context);
  bool isDark=false;
  Widget? lightnessIcon;
  void lightness({bool? fromShared}){
    emit(appInitialState());
    if (fromShared != null)
    {
      isDark = fromShared;
      if(!isDark)
        lightnessIcon=Icon(Icons.nightlight_outlined);
      if(isDark)
        lightnessIcon=Icon(Icons.light_mode);
      emit(LightnessStateb());
    }
    else {
      isDark = !isDark;
      if(!isDark)
        lightnessIcon=Icon(Icons.nightlight_outlined);
      if(isDark)
        lightnessIcon=Icon(Icons.light_mode);
      CashHelper.putBool(key: 'isDark', value: isDark).then((value) {

        emit(LightnessPlusStateb());
      });
    }
  }

}