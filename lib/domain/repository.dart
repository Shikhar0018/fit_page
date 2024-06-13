import 'package:fit_page/data/fit_page_stocks_model.dart';

abstract class FitPageRepository {
  Future<List<FitPageStocksModel>> fetchData();
}
