import 'package:gombok/model/PurchaseModel.dart';

import '../model/TabItem.dart';
import '../repositories/PurchaseRepository.dart';

typedef PurchaseListCallback = void Function(List<PurchaseModel> purchaseList);
typedef ErrorCallback = void Function(dynamic error);

class PurchaseViewModel {
  late final repository = PurchaseRepository();

  Future<List<PurchaseModel>> loadPurchaseList() async {
    try {
      List<PurchaseModel> result = await repository.fetchData();
      print("Loaded list : $result");
      return result;
    } catch (error) {
      print("Error fetching data in viewmodel: $error");
      return List.empty();
    }
  }

  getList(Pages page, List<PurchaseModel>? data, DateTime currentDate) {
    switch (page) {
      case Pages.all:
        if (data != null) {
          return repository.filterListByType(data, currentDate, page);
        }
        break;
      case Pages.other:
        if (data != null) {
          return repository.filterListByType(data, currentDate, page);
        }
        break;
      case Pages.parking:
        if (data != null) {
          return repository.filterListByType(data, currentDate, page);
        }
        break;
      case Pages.shop:
        if (data != null) {
          return repository.filterListByType(data, currentDate, page);
        }
        break;
      default:
    }
  }
}
