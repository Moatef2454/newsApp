// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/layout/news_home/cubit/cubit.dart';
import 'package:news/shear/componates/componantes.dart';

import '../../layout/news_home/cubit/states.dart';

// ignore: camel_case_types
class searchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController=TextEditingController();
    return BlocProvider(
      create: (BuildContext context) =>homeCubit()..getSearch(searchController.text),
      child: BlocConsumer<homeCubit,NewsStates>(
        listener: (BuildContext context, state) {
        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    onTap: () {

                    },
                    onChanged: (value) {
                      homeCubit.get(context).getSearch(searchController.text);
                    },
                    controller: searchController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'search',
                      suffixIcon: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: IconButton(
                          iconSize: 20,
                          onPressed: () {

                          },
                            icon: Icon(Icons.search)),
                      )
                    ),
                  ),
                  SizedBox(height: 15,),
                  Expanded(
                    child: ListView.separated(
                          itemBuilder: (context, index) => NewsItemBuilder(homeCubit.get(context).search[index], context),
                          separatorBuilder: (context, index) => SizedBox(height: 7,),
                          itemCount: homeCubit.get(context).search.length
                      ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
