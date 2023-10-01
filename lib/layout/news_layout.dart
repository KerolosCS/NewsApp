/*
 *
 * ----------------
 * | 241030072002 |
 * ----------------
 * Copyright © [2023] KERO CS FLUTTER DEVELOPMENT.
 * All Rights Reserved. For inquiries or permissions, contact  me ,
 * https://www.linkedin.com/in/kerolos-fady-software-engineer/
 *
 * /
 */

// ignore_for_file: avoid_print

import 'package:auto_reload/auto_reload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/AppCubit/cubit.dart';
import 'package:news_app/NewsCubit/cubit.dart';
import 'package:news_app/NewsCubit/states.dart';
import 'package:news_app/shared/components/defaults.dart';
import 'package:news_app/modules/search.dart';
// import 'package:auto_reload/auto_reload.dart';
// import 'package:news_app/network/remote/dio_helper.dart';
// import 'package:news_app/modules/bussines.dart';

class NewsLayout extends StatefulWidget {
  const NewsLayout({super.key});

  @override
  State<NewsLayout> createState() => _NewsLayoutState();
}

class _NewsLayoutState extends State<NewsLayout> {
  // int _countOfReload = 0;
//   @override
//   void initState() {
//     super.initState();
//     startAutoReload();
//   }
// @override
//   void autoReload() {
//     setState(() {
//       _countOfReload = _countOfReload + 1;
//     });
  // }

  // @override
  // void initState() {
  //   super.initState();
  // }

  var keyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        NewsCubit newsCubit = NewsCubit.get(context);
        return Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     newsCubit.getBusiness();
          //   },
          //   child: const Icon(Icons.add),
          // ),

          appBar: AppBar(
            title: const Text("News App"),
            actions: [
              IconButton(
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
                icon: const Icon(
                  Icons.search,
                  // color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).toggleDark();
                  Auto a = Auto();
                  a.startAutoReload();
                  a.autoReload();
                },
                icon: const Icon(
                  Icons.brightness_2_sharp,
                ),
              ),
            ],
          ),
          body: newsCubit.screens[newsCubit.currentIndexVar],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: newsCubit.currentIndexVar,
            onTap: (index) {
              newsCubit.changeBottomNavBar(index);
            },
            items: newsCubit.bottomItems,
          ),
        );
      },
    );
  }
}

class Auto extends AutoReloader with AutoReloadMixin {
  @override
  void autoReload() {
    // TODO: implement autoReload
    super.autoReload();
  }

  @override
  void startAutoReload() {
    // TODO: implement startAutoReload
    super.startAutoReload();
  }

  @override
  void cancelAutoReload() {
    // TODO: implement cancelAutoReload
    super.cancelAutoReload();
  }
}

// https://newsapi.org/
// v2/top-headlines?
// country=us&category=business&apiKey=5ce4f9c13ddd47ea90ce961c1bd1d149
