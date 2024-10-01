import 'package:flutter/material.dart';
import 'package:new_random/repository/Products_repository.dart';

class BarAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String nameOfAsset;
  final bool revision;
  const BarAppBar({
    super.key,
    required this.nameOfAsset,
    required this.revision,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      forceMaterialTransparency: true,
      title: Image.asset(
        nameOfAsset,
        scale: 1.4,
      ),
      centerTitle: true,
      actions: revision
          ? [
              IconButton(
                onPressed: () {
                  ProductsRepository.shareProducts();
                },
                icon: const Icon(Icons.share),
              ),
            ]
          : [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
