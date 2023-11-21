import 'package:flutter/material.dart';
import 'package:gombok/CustomObjects/CustomDateSelector.dart';
import 'package:gombok/CustomObjects/CustomPurchaseObject.dart';
import 'package:gombok/CustomObjects/CustomTabBar2.dart';
import 'package:gombok/model/PurchaseModel.dart';
import 'package:gombok/model/TabItem.dart';
import '../repositories/PurchaseRepository.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});
  @override
  _PurchaseScreen createState() => _PurchaseScreen();
}

class _PurchaseScreen extends State<PurchaseScreen> {
  late final repository = PurchaseRepository();
  late DateTime currentDate = DateTime(2023, 11);
  late List<PurchaseModel> listOfOtherPurchase;
  late List<PurchaseModel> listOfAllPurchase;
  late List<PurchaseModel> listOfParking;
  late List<PurchaseModel> listOfShop;

  @override
  Widget build(BuildContext context) {
    var purchaseList = repository.fetchData();
    updateLists(purchaseList);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main screen'),
      ),
      body: Column(
        children: [
          CustomDateSelector(
            currentDate,
            (currentDate) => {
              setState(() {
                currentDate = currentDate;
                updateLists(purchaseList);
              }),
            },
            () => {
              debugPrint('CLICKED Back $currentDate'),
              setState(() {
                currentDate = DateTime(currentDate.year, currentDate.month - 1);
                updateLists(purchaseList);
              }),
            },
            () => {
              debugPrint('CLICKED foward $currentDate'),
              setState(() {
                if (currentDate.month != DateTime.now().month) {
                  currentDate =
                      DateTime(currentDate.year, currentDate.month + 1);
                }

                updateLists(purchaseList);
              }),
            },
          ),
          Expanded(
            child: CustomTabBar2(
              tabs: [
                TabItem(
                  tab: Pages.all,
                  title: "Összes",
                  widget: ListView.builder(
                    itemCount: listOfAllPurchase.length,
                    itemBuilder: (context, index) {
                      return CustomPurchaseObject(
                          purchase: listOfAllPurchase[index]);
                    },
                  ),
                ),
                TabItem(
                  tab: Pages.parking,
                  title: "Parkolás",
                  widget: ListView.builder(
                    itemCount: listOfParking.length,
                    itemBuilder: (context, index) {
                      return CustomPurchaseObject(
                          purchase: listOfParking[index]);
                    },
                  ),
                ),
                TabItem(
                  tab: Pages.shop,
                  title: "Bolt",
                  widget: ListView.builder(
                    itemCount: listOfShop.length,
                    itemBuilder: (context, index) {
                      return CustomPurchaseObject(purchase: listOfShop[index]);
                    },
                  ),
                ),
                TabItem(
                  tab: Pages.other,
                  title: "Egyéb",
                  widget: ListView.builder(
                    itemCount: listOfOtherPurchase.length,
                    itemBuilder: (context, index) {
                      return CustomPurchaseObject(
                          purchase: listOfOtherPurchase[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  updateLists(List<PurchaseModel> purchaseList) {
    listOfParking =
        repository.filterListByType(purchaseList, currentDate, Pages.parking);
    listOfAllPurchase =
        repository.filterListByType(purchaseList, currentDate, Pages.all);
    listOfShop =
        repository.filterListByType(purchaseList, currentDate, Pages.shop);
    listOfOtherPurchase =
        repository.filterListByType(purchaseList, currentDate, Pages.other);
  }
}
