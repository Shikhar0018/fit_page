import 'package:fit_page/data/fit_page_stocks_model.dart';
import 'package:fit_page/helper/widgets/indicator_text_field.dart';
import 'package:flutter/material.dart';

class VariableBuilderWidget extends StatelessWidget {
  final The1 model;

  const VariableBuilderWidget({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(model.type),
      ),
      body: getWidgetbasedOnType(context),
    );
  }

  Widget getWidgetbasedOnType(BuildContext context) {
    switch (model.type) {
      case 'value':
        var values = model.values;
        return ListView.builder(
          itemCount: values?.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text((values?[index] ?? 0).toString()),
            );
          },
        );
      case 'indicator':
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.studyType ?? '',
              ),
              Text(
                'Set Parameters: ${model.parameterName ?? ''}',
              ),
              const SizedBox(height: 8),
              IndicatorTextField(
                  minValue: model.minValue ?? 0,
                  maxValue: model.maxValue ?? 0,
                  defaultValue: model.defaultValue ?? 0),
            ],
          ),
        );
      default:
        return const Text('Unknown type');
    }
  }
}
