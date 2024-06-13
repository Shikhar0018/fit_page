import 'dart:convert';

class FitPageStocksModel {
  int id;
  String name;
  String tag;
  String color;
  List<Criterion> criteria;

  FitPageStocksModel({
    required this.id,
    required this.name,
    required this.tag,
    required this.color,
    required this.criteria,
  });

  FitPageStocksModel copyWith({
    int? id,
    String? name,
    String? tag,
    String? color,
    List<Criterion>? criteria,
  }) =>
      FitPageStocksModel(
        id: id ?? this.id,
        name: name ?? this.name,
        tag: tag ?? this.tag,
        color: color ?? this.color,
        criteria: criteria ?? this.criteria,
      );

  factory FitPageStocksModel.fromRawJson(String str) =>
      FitPageStocksModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FitPageStocksModel.fromJson(Map<String, dynamic> json) => FitPageStocksModel(
        id: json["id"],
        name: json["name"],
        tag: json["tag"],
        color: json["color"],
        criteria: List<Criterion>.from(json["criteria"].map((x) => Criterion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "tag": tag,
        "color": color,
        "criteria": List<dynamic>.from(criteria.map((x) => x.toJson())),
      };
}

class Criterion {
  String type;
  String text;
  Variable? variable;

  Criterion({
    required this.type,
    required this.text,
    this.variable,
  });

  Criterion copyWith({
    String? type,
    String? text,
    Variable? variable,
  }) =>
      Criterion(
        type: type ?? this.type,
        text: text ?? this.text,
        variable: variable ?? this.variable,
      );

  factory Criterion.fromRawJson(String str) => Criterion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Criterion.fromJson(Map<String, dynamic> json) => Criterion(
        type: json["type"],
        text: json["text"],
        variable: json["variable"] == null ? null : Variable.fromJson(json["variable"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "text": text,
        "variable": variable?.toJson(),
      };
}

class Variable {
  The1? the1;
  The2? the2;
  The2? the3;
  The1? the4;

  Variable({
    this.the1,
    this.the2,
    this.the3,
    this.the4,
  });

  Variable copyWith({
    The1? the1,
    The2? the2,
    The2? the3,
    The1? the4,
  }) =>
      Variable(
        the1: the1 ?? this.the1,
        the2: the2 ?? this.the2,
        the3: the3 ?? this.the3,
        the4: the4 ?? this.the4,
      );

  factory Variable.fromRawJson(String str) => Variable.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Variable.fromJson(Map<String, dynamic> json) => Variable(
        the1: json["\u00241"] == null ? null : The1.fromJson(json["\u00241"]),
        the2: json["\u00242"] == null ? null : The2.fromJson(json["\u00242"]),
        the3: json["\u00243"] == null ? null : The2.fromJson(json["\u00243"]),
        the4: json["\u00244"] == null ? null : The1.fromJson(json["\u00244"]),
      );

  Map<String, dynamic> toJson() => {
        "\u00241": the1?.toJson(),
        "\u00242": the2?.toJson(),
        "\u00243": the3?.toJson(),
        "\u00244": the4?.toJson(),
      };
}

class The1 {
  String type;
  List<num>? values;
  String? studyType;
  String? parameterName;
  int? minValue;
  int? maxValue;
  int? defaultValue;

  The1({
    required this.type,
    this.values,
    this.studyType,
    this.parameterName,
    this.minValue,
    this.maxValue,
    this.defaultValue,
  });

  The1 copyWith({
    String? type,
    List<num>? values,
    String? studyType,
    String? parameterName,
    int? minValue,
    int? maxValue,
    int? defaultValue,
  }) =>
      The1(
        type: type ?? this.type,
        values: values ?? this.values,
        studyType: studyType ?? this.studyType,
        parameterName: parameterName ?? this.parameterName,
        minValue: minValue ?? this.minValue,
        maxValue: maxValue ?? this.maxValue,
        defaultValue: defaultValue ?? this.defaultValue,
      );

  factory The1.fromRawJson(String str) => The1.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory The1.fromJson(Map<String, dynamic> json) => The1(
        type: json["type"],
        values: json["values"] == null ? [] : convertDynamicListToNumList(json["values"]),
        studyType: json["study_type"],
        parameterName: json["parameter_name"],
        minValue: json["min_value"],
        maxValue: json["max_value"],
        defaultValue: json["default_value"],
      );

  static List<num> convertDynamicListToNumList(dynamic jsonValue) {
    if (jsonValue is! List) {
      throw const FormatException('Expected a list');
    }

    return jsonValue.map<num>((value) {
      if (value is num) {
        return value;
      } else {
        throw const FormatException('Expected a value of type num');
      }
    }).toList();
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "values": values == null ? [] : List<dynamic>.from(values!.map((x) => x)),
        "study_type": studyType,
        "parameter_name": parameterName,
        "min_value": minValue,
        "max_value": maxValue,
        "default_value": defaultValue,
      };
}

class The2 {
  String type;
  List<double> values;

  The2({
    required this.type,
    required this.values,
  });

  The2 copyWith({
    String? type,
    List<double>? values,
  }) =>
      The2(
        type: type ?? this.type,
        values: values ?? this.values,
      );

  factory The2.fromRawJson(String str) => The2.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory The2.fromJson(Map<String, dynamic> json) => The2(
        type: json["type"],
        values: List<double>.from(json["values"].map((x) => x?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "values": List<dynamic>.from(values.map((x) => x)),
      };
}
