import 'package:flutter/material.dart';
import 'package:new_random/Models/Bartenders_Item.dart';
import 'package:new_random/presentation/Persistence/Decoration_for_container.dart';
import 'package:new_random/services/hiveService/Hive_service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BartendresList extends StatefulWidget {
  const BartendresList({super.key});

  @override
  State<BartendresList> createState() => _BartendresListState();
}

class _BartendresListState extends State<BartendresList> {
  final _boxName = HiveService.boxNameForBartendersItem;
  final _hiveService = HiveService();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<BartendersItem>(_boxName).listenable(),
      builder: (BuildContext context, Box<BartendersItem> box, Widget? child) {
        return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  background: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 196, 36, 196),
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [Text('удалить'), Text('удалить')],
                    ),
                  ),
                  key: UniqueKey(),
                  child: Container(
                    decoration: DecorationForContainer.decoration,
                    child: ListTile(
                      title: Text(
                        box.values.toList()[index].bartender,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  onDismissed: (direction) =>
                      _hiveService.deleteBartender(index: index));
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
                  height: 15,
                ),
            itemCount: box.values.toList().length);
      },
    );
  }
}
