import 'package:flutter/material.dart';
import 'package:new_random/Models/Product_Item.dart';
import 'package:new_random/presentation/Revision_screen/Revision_listTile.dart';
import 'package:new_random/repository/Products_repository.dart';

class RevisionScreen extends StatefulWidget {
  const RevisionScreen({super.key});

  @override
  State<RevisionScreen> createState() => _RevisionScreenState();
}

class _RevisionScreenState extends State<RevisionScreen> {
  List<ProductItem> products = [];

  @override
  void initState() {
    products = ProductsRepository.products;
    super.initState();
  }

  void saveCount(int index, String count) {
    products[index].count = count;
    print(products[index].name + products[index].count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ревизия'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              ProductsRepository.shareProducts();
            },
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index) {
            ProductItem product = products[index];

            final productType = product.type.name;
            final previousType = index > 0 ? products[index - 1].type.name : '';
            return productType != previousType
                ? Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: [
                        Text(productType),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: RevisionListTile(
                            product: product,
                            index: index,
                          ),
                        ),
                      ],
                    ),
                  )
                : RevisionListTile(
                    product: product,
                    index: index,
                  );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 5,
              ),
          itemCount: products.length),
    );
  }
}
