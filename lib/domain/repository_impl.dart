import 'package:fit_page/data/fit_page_stocks_model.dart';
import 'package:fit_page/domain/repository.dart';
import 'package:fit_page/helper/strings/api_endpoints.dart';
import 'package:fit_page/network/network_handler.dart';

class FitPageRepositoryImpl implements FitPageRepository {
  @override
  Future<List<FitPageStocksModel>> fetchData() async {
    var networkHandler = NetworkHandler();
    var data = await networkHandler.getRequest(FitPageEndPoints.fitPage);
    List<FitPageStocksModel> response = [];
    try {
      for (var item in data) {
        response.add(FitPageStocksModel.fromJson(item));
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
    return response;
  }
}
