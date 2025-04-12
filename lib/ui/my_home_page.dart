import 'package:fit_page/data/fit_page_cubit.dart';
import 'package:fit_page/helper/databaseHelper/db_helper.dart';
import 'package:fit_page/helper/location_service.dart';
import 'package:fit_page/ui/location_view_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final LocationService locationService = LocationService();
    return BlocProvider(
      create: (context) => EnterSliceCubit(locationService),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: const LocationViewScreen(),
      ),
    );
  }
}
