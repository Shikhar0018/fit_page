import 'package:fit_page/data/fit_page_stocks_model.dart';
import 'package:fit_page/helper/widgets/stock_detail.dart';
import 'package:fit_page/domain/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fit_page_state.dart';

class FitPageCubit extends Cubit<FitPageState> {
  final FitPageRepository repository;
  FitPageCubit(this.repository) : super(FitPageInitial());

  void fetchData() async {
    emit(FitPageLoading());
    var data = await repository.fetchData();
    emit(FitPageLoaded(fitPageData: data));
  }

  void navigateToStockDetail(FitPageStocksModel stockData, BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => StockDetail(stockData: stockData)));
  }
}
