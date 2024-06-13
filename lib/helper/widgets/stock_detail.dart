import 'package:fit_page/data/fit_page_stocks_model.dart';
import 'package:fit_page/helper/extensions/model_extension.dart';
import 'package:flutter/material.dart';

class StockDetail extends StatelessWidget {
  final FitPageStocksModel stockData;
  const StockDetail({super.key, required this.stockData});

  @override
  Widget build(BuildContext context) {
    var criteria = stockData.criteria;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: '${stockData.name}  ',
                style: const TextStyle(fontSize: 20, color: Colors.black),
              ),
              TextSpan(
                text: stockData.tag,
                style: TextStyle(fontSize: 16, color: stockData.getColor),
              ),
            ],
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: criteria.map((e) => e.getWidget(context)).toList(),
        ),
      ),
    );
  }
}
