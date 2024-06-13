import 'package:fit_page/data/fit_page_cubit.dart';
import 'package:fit_page/domain/repository_impl.dart';
import 'package:fit_page/helper/strings/app_strings.dart';
import 'package:fit_page/ui/my_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
      create: (context) => FitPageCubit(
            FitPageRepositoryImpl(),
          ),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppStrings.appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: AppStrings.appTitle),
    );
  }
}
