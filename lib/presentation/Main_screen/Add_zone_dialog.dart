import 'package:flutter/material.dart';
import 'package:new_random/Models/Work_shifts_item.dart';
import 'package:new_random/presentation/Persistence/Decoration_for_container.dart';
import 'package:new_random/services/hiveService/Hive_service.dart';

class AddZoneDialog extends StatelessWidget {
  final WorkShiftsItem workShiftItem;
  final int index;
  const AddZoneDialog(
      {super.key, required this.workShiftItem, required this.index});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final HiveService hive = HiveService();

    return SimpleDialog(
      contentPadding: const EdgeInsets.all(20),
      title: const Text('Добавить зону'),
      children: [
        TextField(
          autofocus: true,
          cursorColor: Colors.black,
          cursorWidth: 20,
          controller: controller,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.black26,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: DecorationForContainer.decoration,
              child: MaterialButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      hive.addZoneForWorkShift(
                          workShift: workShiftItem,
                          index: index,
                          zone: controller.text);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Добавить')),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: DecorationForContainer.decoration,
              child: MaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Отмена')),
            )
          ],
        )
      ],
    );
  }
}
