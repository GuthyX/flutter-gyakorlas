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
  var isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color.appBarBackgroundColor,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
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
                currentDate = currentDate;
              }),
            },
            () => {
              setState(() {
                currentDate = DateTime(currentDate.year, currentDate.month - 1);
              }),
            },
            () => {
              setState(() {
                if (currentDate.month != DateTime.now().month) {
                  currentDate =
                      DateTime(currentDate.year, currentDate.month + 1);
                }
              }),
            },
          ),
          Expanded(
            child: CustomTabBar2(
              tabs: [
                TabItem(
                  tab: Pages.all,
                  title: "Összes",
                  widget: FutureBuilder<List<PurchaseModel>>(
                    future: viewModel.loadPurchaseList(),
                    builder: (context, snapshot) {
                      var list = viewModel.getList(
                          Pages.all, snapshot.data, currentDate);
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Text('Nincs kapcsolat');
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(
                              color: color.colorPrimary,
                            ),
                          );
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            return Text('Hiba történt: ${snapshot.error}');
                          }
                          return ListView.builder(
                            itemCount: list == null ? 0 : list.length,
                            itemBuilder: (context, index) {
                              return CustomPurchaseObject(
                                purchase: list[index],
                                onClick: () => {
                                  print('CLicked on Row'),
                                },
                              );
                            },
                          );
                        default:
                          return const Text('Valami váratlan történt');
                      }
                    },
                  ),
                ),
                TabItem(
                  tab: Pages.parking,
                  title: "Parkolás",
                  widget: FutureBuilder<List<PurchaseModel>>(
                    future: viewModel.loadPurchaseList(),
                    builder: (context, snapshot) {
                      var list = viewModel.getList(
                          Pages.parking, snapshot.data, currentDate);
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Text('Nincs kapcsolat');
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(
                              color: color.colorPrimary,
                            ),
                          );
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            return Text('Hiba történt: ${snapshot.error}');
                          }
                          return ListView.builder(
                            itemCount: list == null ? 0 : list.length,
                            itemBuilder: (context, index) {
                              return CustomPurchaseObject(
                                purchase: list[index],
                                onClick: () => {
                                  print('CLicked on Row'),
                                },
                              );
                            },
                          );
                        default:
                          return const Text('Valami váratlan történt');
                      }
                    },
                  ),
                ),
                TabItem(
                  tab: Pages.shop,
                  title: "Bolt",
                  widget: FutureBuilder<List<PurchaseModel>>(
                    future: viewModel.loadPurchaseList(),
                    builder: (context, snapshot) {
                      var list = viewModel.getList(
                          Pages.shop, snapshot.data, currentDate);
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Text('Nincs kapcsolat');
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(
                              color: color.colorPrimary,
                            ),
                          );
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            return Text('Hiba történt: ${snapshot.error}');
                          }
                          return ListView.builder(
                            itemCount: list == null ? 0 : list.length,
                            itemBuilder: (context, index) {
                              return CustomPurchaseObject(
                                purchase: list[index],
                                onClick: () => {
                                  print('CLicked on Row'),
                                },
                              );
                            },
                          );
                        default:
                          return const Text('Valami váratlan történt');
                      }
                    },
                  ),
                ),
                TabItem(
                  tab: Pages.other,
                  title: "Egyéb",
                  widget: FutureBuilder<List<PurchaseModel>>(
                    future: viewModel.loadPurchaseList(),
                    builder: (context, snapshot) {
                      var list = viewModel.getList(
                          Pages.other, snapshot.data, currentDate);
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return const Text('Nincs kapcsolat');
                        case ConnectionState.waiting:
                          return Center(
                            child: CircularProgressIndicator(
                              color: color.colorPrimary,
                            ),
                          );
                        case ConnectionState.done:
                          if (snapshot.hasError) {
                            return Text('Hiba történt: ${snapshot.error}');
                          }
                          return ListView.builder(
                            itemCount: list == null ? 0 : list.length,
                            itemBuilder: (context, index) {
                              return CustomPurchaseObject(
                                purchase: list[index],
                                onClick: () => {
                                  print('CLicked on Row'),
                                },
                              );
                            },
                          );
                        default:
                          return const Text('Valami váratlan történt');
                      }
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
}
