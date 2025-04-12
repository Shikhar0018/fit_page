import 'dart:async';
import 'package:fit_page/helper/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fit_page_state.dart';

class EnterSliceCubit extends Cubit<EnterSliceState> {
  final LocationService _locationService;
  StreamSubscription<String>? _locationSubscription;

  EnterSliceCubit(this._locationService) : super(const EnterSliceInitial()) {
    _initializeLocation();
    _setupLocationListener();
  }

  Future<void> _initializeLocation() async {
    try {
      await _locationService.startService();
      // final lastLocation = await _locationService.getLastLocation();
      // emit(EnterSliceUpdated(lastLocation ?? 'No location data'));
    } catch (e) {
      emit(EnterSliceError(e.toString()));
    }
  }

  void _setupLocationListener() {
    _locationSubscription = _locationService.locationStream.listen(
      (newLocation) {
        emit(EnterSliceUpdated(newLocation));
      },
      onError: (error) => emit(EnterSliceError(error.toString())),
    );
  }

  @override
  Future<void> close() {
    _locationSubscription?.cancel();
    return super.close();
  }
}
