import 'package:flutter/material.dart';
import 'package:gombok/CustomObjects/CustomDateSelector.dart';
import 'package:gombok/CustomObjects/CustomPurchaseObject.dart';
import 'package:gombok/CustomObjects/CustomTabBar2.dart';
import 'package:gombok/model/PurchaseModel.dart';
import 'package:gombok/model/TabItem.dart';
import 'package:gombok/res/Color.dart' as color;
import 'package:gombok/viewModels/PurchaseScreenViewModel.dart';
import '../repositories/PurchaseRepository.dart';

class PurchaseScreen extends StatefulWidget {
  const PurchaseScreen({super.key});
  @override
  _PurchaseScreen createState() => _PurchaseScreen();
}

class _PurchaseScreen extends State<PurchaseScreen> {
  late final repository = PurchaseRepository();
  late final viewModel = PurchaseViewModel();
  late DateTime currentDate = DateTime(2023, 11);
  late List<PurchaseModel> listOfOtherPurchase;
  late List<PurchaseModel> listOfAllPurchase;
  late List<PurchaseModel> listOfParking;
  late List<PurchaseModel> listOfShop;
  var isLoading = true;

  @override
  void initState() {
    super.initState();
    viewModel.loadPurchaseList(
      onSuccess: (List<PurchaseModel> purchaseList) {
        setState(() {
          isLoading = false;
          listOfAllPurchase = purchaseList;
        });
        print("Successfully loaded purchase list: $purchaseList");
      },
      onError: (dynamic error) {
        print("Error loading purchase list: $error");
      },
    );
    setState(() {
      listOfAllPurchase = viewModel.purchaseList;
    });

    print("InitState list of: $listOfAllPurchase");
  }

  @override
  Widget build(BuildContext context) {
    //  var purchaseList = viewModel.purchaseList;
    updateLists(listOfAllPurchase);

    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            color.appBarBackgroundColor, // Set the background color
        elevation: 0, // Remove the shadow
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0), // Adjust the radius as needed
            bottomRight: Radius.circular(20.0), // Adjust the radius as needed
          ),
        ),
        title: const Text('Purchase screen'),
      ),
      body: Column(
        children: [
          CustomDateSelector(
            currentDate,
            (currentDate) => {
              setState(() {
                print('list OF PAREMTERES FUGG $listOfAllPurchase');
                currentDate = currentDate;
                updateLists(listOfAllPurchase);
              }),
            },
            () => {
              debugPrint('CLICKED Back $currentDate'),
              setState(() {
                print('list OF BACK $listOfAllPurchase');
                listOfAllPurchase = viewModel.purchaseList;
                currentDate = DateTime(currentDate.year, currentDate.month - 1);
                updateLists(listOfAllPurchase);
              }),
            },
            () => {
              debugPrint('CLICKED foward $currentDate'),
              setState(() {
                print('list OF FOWARD $listOfAllPurchase');
                listOfAllPurchase = viewModel.purchaseList;
                if (currentDate.month != DateTime.now().month) {
                  currentDate =
                      DateTime(currentDate.year, currentDate.month + 1);
                }

                updateLists(listOfAllPurchase);
              }),
            },
          ),
          Expanded(
            child: CustomTabBar2(
              tabs: [
                TabItem(
                  tab: Pages.all,
                  title: "Összes",
                  widget: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                              color: color.colorPrimary),
                        )
                      : ListView.builder(
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
