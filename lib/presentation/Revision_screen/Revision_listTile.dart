import 'package:flutter/material.dart';
import 'package:new_random/Models/Product_Item.dart';
import 'package:new_random/presentation/Persistence/Decoration_for_container.dart';
import 'package:new_random/repository/Products_repository.dart';

class RevisionListTile extends StatefulWidget {
  final ProductItem product;
  final int index;
  const RevisionListTile(
      {super.key, required this.product, required this.index});

  @override
  State<RevisionListTile> createState() => _RevisionListTileState();
}

class _RevisionListTileState extends State<RevisionListTile> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    controller.text = ProductsRepository.products[widget.index].count;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
      decoration: DecorationForContainer.decoration,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.product.name,
            style: const TextStyle(fontSize: 18),
          ),
          Container(
            width: MediaQuery.sizeOf(context).width / 3,
            decoration: DecorationForContainer.decoration,
            child: TextField(
              decoration: const InputDecoration(border: InputBorder.none),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              controller: controller,
              onChanged: (value) =>
                  ProductsRepository.changeCount(widget.index, value),
            ),
          ),
        ],
      ),
    );
  }
}
