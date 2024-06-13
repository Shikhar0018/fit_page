import 'package:fit_page/data/fit_page_stocks_model.dart';
import 'package:fit_page/helper/widgets/variable_builder_widget.dart';
import 'package:flutter/material.dart';

extension StringInterpolation on String {
  String get capitalize => this[0].toUpperCase() + substring(1);
}

extension CriterionExtension on Criterion {
  Widget getWidget(BuildContext context) {
    switch (type) {
      case 'plain_text':
        return Text(text);
      case 'variable':
        return variableWidget(variable?.toJson() ?? {}, text, context);
      default:
        return const Text('Unknown type');
    }
  }

  Widget variableWidget(
    Map<String, dynamic> keyValueMap,
    String text,
    BuildContext context,
  ) {
    List<InlineSpan> richText = [];
    RegExp regExp = RegExp(r'\$[0-9]+(?:\.[0-9]{1,2})?');
    Iterable<RegExpMatch> matches = regExp.allMatches(text);
    int lastMatchEnd = 0;

    for (var match in matches) {
      // Add text before the match
      if (match.start > lastMatchEnd) {
        richText.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: const TextStyle(color: Colors.black),
        ));
      }

      String? key = match.group(0);
      if (key != null && keyValueMap.containsKey(key)) {
        var value = keyValueMap[key];
        if (value != null) {
          var theModel = The1.fromJson(value);
          var type = theModel.type;
          switch (type) {
            case 'value':
              var numList = theModel.values ?? [];
              if (numList.isNotEmpty) {
                richText.add(WidgetSpan(
                  alignment: PlaceholderAlignment.baseline,
                  baseline: TextBaseline.alphabetic,
                  child: GestureDetector(
                    onTap: () => navigateToValueList(context, model: theModel),
                    child: Text(
                      numList[0].toString(),
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                    ),
                  ),
                ));
              }
              break;
            case 'indicator':
              richText.add(WidgetSpan(
                alignment: PlaceholderAlignment.baseline,
                baseline: TextBaseline.alphabetic,
                child: GestureDetector(
                  onTap: () => navigateToValueList(context, model: theModel),
                  child: Text(
                    theModel.defaultValue.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ),
              ));
              break;
          }
        }
      }
      lastMatchEnd = match.end;
    }

    // Add remaining text after the last match
    if (lastMatchEnd < text.length) {
      richText.add(TextSpan(
        text: text.substring(lastMatchEnd),
        style: const TextStyle(color: Colors.black),
      ));
    }

    return RichText(
      text: TextSpan(
        children: richText,
        style: const TextStyle(fontSize: 16), // Default text style
      ),
    );
  }

  navigateToValueList(BuildContext context, {required The1 model}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VariableBuilderWidget(
          model: model,
        ),
      ),
    );
  }
}

extension FitPageStocksModelExtension on FitPageStocksModel {
  Color get getColor {
    switch (color) {
      case 'red':
        return Colors.red;
      case 'green':
        return Colors.green;
      case 'blue':
        return Colors.blue;
      default:
        return Colors.black;
    }
  }
}
