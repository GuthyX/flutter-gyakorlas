import 'package:flutter/material.dart';
import 'package:gombok/CustomObjects/CustomFormatter.dart';
import 'package:gombok/model/PurchaseModel.dart';
import 'package:gombok/model/TabItem.dart';

class CustomPurchaseObject extends StatefulWidget {
  final PurchaseModel purchase;

  const CustomPurchaseObject({Key? key, required this.purchase})
      : super(key: key);

  @override
  _CustomPurchaseObject createState() => _CustomPurchaseObject();
}

class _CustomPurchaseObject extends State<CustomPurchaseObject> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            Icon(
              getIcon(widget.purchase.type),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    CustomFormatter.formatCurrency(
                        widget.purchase.price.round(), 'hu_HU'),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    CustomFormatter.FormatDateTime(widget.purchase.date),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    widget.purchase.randomNum,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: () => {},
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        const Divider(
          height: 10,
        ),
      ],
    );
  }
}

IconData? getIcon(Pages type) {
  switch (type) {
    case Pages.parking:
      return const IconData(0xe39d, fontFamily: 'MaterialIcons');

    case Pages.shop:
      return const IconData(0xe39a, fontFamily: 'MaterialIcons');

    case Pages.other:
      return const IconData(0xe392, fontFamily: 'MaterialIcons');
    case Pages.all:
      return const IconData(0xa392, fontFamily: 'MaterialIcons');
    default:
      return const IconData(0x392a, fontFamily: 'MaterialIcons');
  }
}
