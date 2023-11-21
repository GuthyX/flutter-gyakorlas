import 'dart:async';

import '../model/PurchaseModel.dart';
import '../model/TabItem.dart';

class PurchaseRepository {
  List<PurchaseModel> fetchData() {
    return [
      PurchaseModel(
        type: Pages.parking,
        price: 200,
        date: DateTime(2023, 11, 12),
        randomNum: "062022323",
      ),
      PurchaseModel(
        type: Pages.shop,
        price: 400,
        date: DateTime(2023, 2, 1),
        randomNum: "062022323",
      ),
      PurchaseModel(
        type: Pages.parking,
        price: 600,
        date: DateTime(2023, 2, 12),
        randomNum: "062022323",
      ),
      PurchaseModel(
        type: Pages.shop,
        price: 450,
        date: DateTime(2023, 7, 1),
        randomNum: "062022323",
      ),
      PurchaseModel(
        type: Pages.other,
        price: 234,
        date: DateTime(2023, 11, 11),
        randomNum: "062022323",
      ),
      PurchaseModel(
        type: Pages.shop,
        price: 234,
        date: DateTime(2023, 11, 11),
        randomNum: "062022323",
      ),
      PurchaseModel(
        type: Pages.other,
        price: 234,
        date: DateTime(2023, 11, 11),
        randomNum: "062022323",
      )
    ];
  }

  List<PurchaseModel> filterListByType(
      List<PurchaseModel> purchaseList, DateTime current, Pages type) {
    switch (type) {
      case Pages.all:
        return purchaseList.where((purchase) {
          return current.month == purchase.date.month;
        }).toList();
      case Pages.parking:
        return purchaseList.where((purchase) {
          return purchase.type == Pages.parking &&
              current.month == purchase.date.month;
        }).toList();
      case Pages.shop:
        return purchaseList.where((purchase) {
          return purchase.type == Pages.shop &&
              current.month == purchase.date.month;
        }).toList();
      default:
        return purchaseList.where((purchase) {
          return purchase.type != Pages.parking &&
              purchase.type != Pages.shop &&
              current.month == purchase.date.month;
        }).toList();
    }
  }
}
