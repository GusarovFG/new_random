import 'package:flutter/material.dart';
import 'package:new_random/Models/Work_shifts_item.dart';
import 'package:new_random/presentation/Persistence/Decoration_for_container.dart';
import 'package:new_random/services/hiveService/Hive_service.dart';

class AddWorkShiftDialog extends StatelessWidget {
  const AddWorkShiftDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final HiveService hive = HiveService();

    return SimpleDialog(
      contentPadding: const EdgeInsets.all(20),
      title: const Text(
        'ДОБАВИТЬ ЖРЕБИЙ',
        textAlign: TextAlign.center,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        side: BorderSide(
          color: Color.fromARGB(255, 196, 36, 196),
          width: 1,
        ),
      ),
      children: [
        Container(
          decoration: DecorationForContainer.decoration,
          child: TextField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(border: InputBorder.none),
            autofocus: true,
            cursorColor: const Color.fromARGB(255, 196, 36, 196),
            cursorWidth: 5,
            controller: controller,
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
                      final workShip =
                          WorkShiftsItem(title: controller.text, zones: []);
                      hive.addWorkShift(workShift: workShip);
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
