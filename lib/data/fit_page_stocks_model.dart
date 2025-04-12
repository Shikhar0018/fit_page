import 'dart:convert';

class EnterSliceGeoLocationModel {
  final String location;
  final String? error;

  const EnterSliceGeoLocationModel(this.location, this.error);

  factory EnterSliceGeoLocationModel.fromJson(Map<String, dynamic> json) {
    return EnterSliceGeoLocationModel(
      json['location'] as String,
      json['error'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'error': error,
    };
  }

  @override
  String toString() {
    return 'EnterSliceGeoLocationModel(location: $location, error: $error)';
  }
}
