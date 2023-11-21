import 'package:flutter/material.dart';
import 'package:gombok/res/Color.dart' as CustomColor;

class ExampleTabSelector extends StatelessWidget {
  final List<String> tabList = ['apple', 'banana', 'cherry', 'date'];

  ExampleTabSelector({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabSelector();
  }
}

class TabSelector extends StatefulWidget {
  @override
  _TabSelectorState createState() => _TabSelectorState();
}

class _TabSelectorState extends State<TabSelector> {
  String selectedTab = 'all';

  void onTabSelected(String tabType) {
    setState(() {
      selectedTab = tabType;
    });
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text("Kiválasztott elem típusa: $selectedTab"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    var tabList = ['apple', 'banana', 'cherry', 'date'];
    return SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height * 0.05,
              color: CustomColor.colorPrimary,
              child: Stack(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.04,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tabList.length,
                      itemBuilder: (context, index) {
                        return Text("test");
                      },
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget buildTab(String label, String tabType) {
    final isSelected = tabType == selectedTab;
    return Expanded(
      child: InkWell(
        onTap: () => onTabSelected(tabType),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          alignment: Alignment.center,
          color: isSelected ? Colors.blue : Colors.grey,
          child: Text(
            label,
            style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
