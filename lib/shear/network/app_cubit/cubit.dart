// ignore_for_file: curly_braces_in_flow_control_structures, prefer_conditional_assignment

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_home/cubit/states.dart';
import 'package:news/shear/network/app_cubit/states.dart';
import 'package:news/shear/network/local/cash_helper.dart';
import 'package:news/shear/network/remote/dio_helper.dart';

class appCubit extends Cubit<appStates>{
  appCubit():super(appInitialState());
  static appCubit get(context)=>BlocProvider.of(context);
  bool isDark=false;
  void lightness({bool? fromShared}){
    emit(appInitialState());
    if (fromShared != null)
    {
      isDark = fromShared;
      emit(LightnessStateb());
    }
    else {
      isDark = !isDark;
      CashHelper.putBool(key: 'isDark', value: isDark).then((value) {
        emit(LightnessPlusStateb());
      });
    }
  }

}