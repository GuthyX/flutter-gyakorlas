import 'package:gombok/model/PurchaseModel.dart';

import '../model/TabItem.dart';
import '../repositories/PurchaseRepository.dart';

typedef PurchaseListCallback = void Function(List<PurchaseModel> purchaseList);
typedef ErrorCallback = void Function(dynamic error);

class PurchaseViewModel {
  late final repository = PurchaseRepository();
  late List<PurchaseModel> purchaseList = [];
  late Future<List<PurchaseModel>> futurePurchaseData;
  late List<PurchaseModel> listOfOtherPurchase = [];
  late List<PurchaseModel> listOfAllPurchase = [];
  late List<PurchaseModel> listOfParking = [];
  late List<PurchaseModel> listOfShop = [];

  Future<void> loadPurchaseList({
    required PurchaseListCallback onSuccess,
    required ErrorCallback onError,
  }) async {
    try {
      List<PurchaseModel> result = await repository.fetchData();
      purchaseList = result;
      print("Loaded list : $purchaseList");
      onSuccess(result); // Call the success callback with the result
    } catch (error) {
      // Handle any errors that occurred during the fetchData operation
      print("Error fetching data in viewmodel: $error");
      onError(error); // Call the error callback with the error
    }
  }

  updateLists(DateTime currentDate) {
    listOfParking =
        repository.filterListByType(purchaseList, currentDate, Pages.parking);
    listOfAllPurchase =
        repository.filterListByType(purchaseList, currentDate, Pages.all);
    listOfShop =
        repository.filterListByType(purchaseList, currentDate, Pages.shop);
    listOfOtherPurchase =
        repository.filterListByType(purchaseList, currentDate, Pages.other);
  }

  getPurchaseList() {
    return purchaseList;
  }
}
