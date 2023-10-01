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

// import 'package:auto_reload/auto_reload.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/NewsCubit/cubit.dart';
import 'package:news_app/shared/components/defaults.dart';

import '../NewsCubit/states.dart';

// ignore: must_be_immutable
class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: defaultFormFeild(
                    controller: searchController,
                    type: TextInputType.text,
                    label: 'Search',
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'Search musn\'t be empty';
                      }
                      return null;
                    },
                    prefix: Icons.search,
                    onChange: (value) {
                      NewsCubit.get(context).getSearch(value);
                    }),
              ),
              Expanded(
                child: articleBuilder(
                  NewsCubit.get(context).search,
                  context,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
