part of 'fit_page_cubit.dart';

@immutable
abstract class EnterSliceState {
  final String location;
  final String? error;
  const EnterSliceState(this.location, this.error);
}

class EnterSliceInitial extends EnterSliceState {
  const EnterSliceInitial() : super("Unknown", null);
}

class EnterSliceLoading extends EnterSliceState {
  const EnterSliceLoading() : super("Loading", null);
}

class EnterSliceUpdated extends EnterSliceState {
  // final EnterSliceGeoLocationModel geoLocationData;
  const EnterSliceUpdated(String location) : super(location, null);
}

class EnterSliceError extends EnterSliceState {
  const EnterSliceError(String error) : super("Unknown", error);
}
