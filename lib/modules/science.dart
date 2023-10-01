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

import '../NewsCubit/cubit.dart';
import '../NewsCubit/states.dart';
import '../shared/components/defaults.dart';

class ScienceSreen extends StatelessWidget {
  const ScienceSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var scienceList = NewsCubit.get(context).science;

        return articleBuilder(scienceList, context);
      },
    );
  }
}
//Test Branch
//Test Branch
//Test Branch
//Test Branch
//Test Branch
//Test Branch
//test 2
