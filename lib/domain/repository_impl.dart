import 'package:fit_page/data/fit_page_stocks_model.dart';
import 'package:fit_page/domain/repository.dart';
import 'package:fit_page/helper/strings/api_endpoints.dart';
import 'package:fit_page/network/network_handler.dart';

// class EnterSliceRepositoryImpl implements EnterSliceRepository {
//   @override
//   Future<List<EnterSliceStocksModel>> fetchData() async {
//     var networkHandler = NetworkHandler();
//     var data = await networkHandler.getRequest(EnterSliceEndPoints.fitPage);
//     List<EnterSliceStocksModel> response = [];
//     try {
//       for (var item in data) {
//         response.add(EnterSliceStocksModel.fromJson(item));
//       }
//     } on Exception catch (e) {
//       throw Exception(e);
//     }
//     return response;
//   }
// }
