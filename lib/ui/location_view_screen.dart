import 'package:fit_page/data/fit_page_cubit.dart';
import 'package:fit_page/helper/databaseHelper/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationViewScreen extends StatefulWidget {
  const LocationViewScreen({super.key});

  @override
  State<LocationViewScreen> createState() => _LocationViewScreenState();
}

class _LocationViewScreenState extends State<LocationViewScreen> {
  late final EnterSliceCubit _enterSliceCubit;

  @override
  void initState() {
    super.initState();
    _enterSliceCubit = context.read<EnterSliceCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EnterSliceCubit, EnterSliceState>(
      builder: (context, state) {
        if (state is EnterSliceLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is EnterSliceUpdated) {
          return Center(child: Text('Location: ${state.location}'));
        } else if (state is EnterSliceError) {
          return Center(child: Text('Error: ${state.error}'));
        }
        return const Center(child: Text('Unknown state'));
      },
    );
  }
}
