import 'package:flutter/material.dart';
import 'package:gombok/model/TabItem.dart';
import 'package:gombok/res/Color.dart' as CustomColor;

class CustomTabBar2 extends StatefulWidget {
  final List<TabItem> tabs;

  const CustomTabBar2({Key? key, required this.tabs}) : super(key: key);

  @override
  _CustomTabBar2 createState() => _CustomTabBar2();
}

class _CustomTabBar2 extends State<CustomTabBar2>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabTap(int index) {
    // You can navigate to different pages based on the index
    // Here, we are just printing the selected tab index
  }

  @override
  Widget build(BuildContext context) {
    final List<TabItem> tabs = widget.tabs;
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 1),
            labelColor: CustomColor.colorPrimary,
            controller: _tabController,
            onTap: _handleTabTap,
            indicator: UnderlineTabIndicator(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              borderSide:
                  BorderSide(width: 3.0, color: CustomColor.colorPrimary),
              insets: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            //        indicatorColor: Colors.green,
            indicatorWeight: 2.0, // Adjust the thickness of the indicator line
            tabs: tabs.map((tab) => Tab(text: tab.title)).toList(),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController, children: getTabLabels(tabs)),
          ),
        ],
      ),
    );
  }

  List<Widget> getTabLabels(List<TabItem> tabs) {
    return tabs.map((tab) => tab.widget).toList();
  }
}
