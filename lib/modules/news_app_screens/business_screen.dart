// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_home/cubit/cubit.dart';
import 'package:news/shear/componates/componantes.dart';

import '../../layout/news_home/cubit/states.dart';

// ignore: camel_case_types
class businessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>homeCubit()..getBusinessNews(),
      child: BlocConsumer<homeCubit,NewsStates>(
        listener: (BuildContext context, state) {
        },
        builder: (BuildContext context, Object? state) {
          return  ConditionalBuilder(
            condition: homeCubit.get(context).business.length>0,
            builder: (BuildContext context) =>ListView.separated
              (
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => NewsItemBuilder(homeCubit.get(context).business[index], context),
                separatorBuilder: (context, index) => SizedBox(height: 10,),
                itemCount: homeCubit.get(context).business.length
            ),
            fallback: (BuildContext context) =>Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
