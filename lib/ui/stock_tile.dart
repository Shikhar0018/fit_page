import 'package:fit_page/data/fit_page_cubit.dart';
import 'package:fit_page/data/fit_page_stocks_model.dart';
import 'package:fit_page/helper/extensions/model_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockTile extends StatelessWidget {
  final FitPageStocksModel stockData;
  const StockTile({
    super.key,
    required this.stockData,
  });

  @override
  Widget build(BuildContext context) {
    final fitPageCubit = BlocProvider.of<FitPageCubit>(context);
    return Card(
      child: ListTile(
        onTap: () => fitPageCubit.navigateToStockDetail(stockData, context),
        title: Text(stockData.name),
        subtitle: Text(stockData.tag, style: TextStyle(color: stockData.getColor)),
      ),
    );
  }
}
