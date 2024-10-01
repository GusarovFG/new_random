import 'package:flutter/material.dart';
import 'package:new_random/presentation/Persistence/Decoration_for_container.dart';

class DetailListTile extends StatelessWidget {
  final String workShift;
  final String? bartender;
  const DetailListTile({super.key, required this.workShift, this.bartender});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: DecorationForContainer.decoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            workShift,
            style: const TextStyle(fontSize: 20),
          ),
          const Divider(
            height: 2,
            color: Colors.white,
          ),
          Text(
            bartender ?? '',
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
