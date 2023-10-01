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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/AppCubit/cubit.dart';
import 'package:news_app/AppCubit/states.dart';
import 'package:news_app/NewsCubit/cubit.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/themes.dart';
import 'constants/const.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  // //if (true) {
  //   await DesktopWindow.setMinWindowSize(
  //     const Size(650, 700),
  //   );
  // //}

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  runApp(MyApp(
    cachedTheme: isDark,
  ));
}

//// https://newsapi.org/
///v2/everything?
///q=tesla&from=2023-06-13&sortBy=publishedAt&apiKey=5ce4f9c13ddd47ea90ce961c1bd1d149
class MyApp extends StatelessWidget {
  final bool? cachedTheme;
  const MyApp({super.key, required this.cachedTheme});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NewsCubit()..getBusiness()),
        BlocProvider(
          create: (context) => AppCubit()..toggleDark(fromShared: cachedTheme),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: light,
            darkTheme: dark,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const NewsLayout(),
          );
        },
      ),
    );
  }
}

//update
