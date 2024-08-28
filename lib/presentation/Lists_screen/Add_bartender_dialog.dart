import 'package:flutter/material.dart';
import 'package:new_random/Models/Bartenders_Item.dart';
import 'package:new_random/services/hiveService/Hive_service.dart';

class AddBartenderDialog extends StatelessWidget {
  const AddBartenderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    final HiveService hive = HiveService();

    return SimpleDialog(
      contentPadding: const EdgeInsets.all(20),
      title: const Text('Добавит бармена'),
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
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 2,

                    offset: Offset(8, 10), // changes position of shadow
                  ),
                ],
              ),
              child: MaterialButton(
                  onPressed: () {
                    if (controller.text.isNotEmpty) {
                      final bartender =
                          BartendersItem(bartender: controller.text);
                      hive.addBartender(bartender: bartender);
                      Navigator.pop(context);
                    }
                  },
                  child: const Text('Добавить')),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 2,

                    offset: Offset(8, 10), // changes position of shadow
                  ),
                ],
              ),
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
