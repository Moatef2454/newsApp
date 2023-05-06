// ignore_for_file: curly_braces_in_flow_control_structures, prefer_conditional_assignment

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_home/cubit/states.dart';
import 'package:news/shear/network/local/cash_helper.dart';
import 'package:news/shear/network/remote/dio_helper.dart';

class homeCubit extends Cubit<NewsStates>{
  homeCubit():super(NewsInitialState());
  static homeCubit get(context)=>BlocProvider.of(context);
  int currantIndex=0;
  List <dynamic> business=[];
  List <dynamic> science=[];
  List <dynamic> sports=[];
  List <dynamic> search=[];
  bool dark=false;
  void lightness({bool? fromShared}){
    if(dark==true){
      dark=false;
      CashHelper.putBool(key: 'dark', value: dark!).then((value) {
        emit(LightnessState());
        print(dark);
      });
    }
    else{
      dark=true;
      CashHelper.putBool(key: 'dark', value: dark!).then((value) {
        emit(LightnessState());
        print(dark);
      });
    }
  }
  void bottomNavigationBar(int index){
   currantIndex=index;
   emit(bottomNavigationBarState());

  }
  void getBusinessNews(){
    emit(BusinessNewsLoadingState());
    DioHelper.getNews(
        url: 'v2/top-headlines',
        query:
        {
          'country':'US',
          'category':'business',
          'apiKey':'e853f72304dc4034b090bf7a74bcce6e',
        }).then((value) {
          business=value.data['articles'];
          emit(BusinessNewsSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(BusinessNewsErrorState());
    });
  }
  void getScienceNews(){
    emit(ScienceNewsLoadingState());

      DioHelper.getNews(
          url: 'v2/top-headlines',
          query:
          {
            'country':'US',
            'category':'science',
            'apiKey':'e853f72304dc4034b090bf7a74bcce6e',
          }).then((value) {
        science=value.data['articles'];
        emit(ScienceNewsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(ScienceNewsErrorState());
      });
  }
  void getSportsNews(){
    emit(SportsNewsLoadingState());
      DioHelper.getNews(
          url: 'v2/top-headlines',
          query:
          {
            'country':'US',
            'category':'sports',
            'apiKey':'e853f72304dc4034b090bf7a74bcce6e',
          }).then((value) {
        sports=value.data['articles'];
        emit(SportsNewsSuccessState());
      }).catchError((error){
        print(error.toString());
        emit(SportsNewsErrorState());
      });
  }
  void getSearch(String text){
    emit(SearchNewsLoadingState());
    search=[];
    DioHelper.getNews(
        url: 'v2/everything',
        query: {
          'q':text,
          'apiKey':'65f7f556ec76449fa7dc7c0069f040ca'
        }
    ).
    then((value){
      search =value.data['articles'];
      emit(SearchNewsSuccessState());
    }
    ).
    catchError((error){
      print(error.toString());
      emit(SearchNewsErrorState());
    }
    );
}
}