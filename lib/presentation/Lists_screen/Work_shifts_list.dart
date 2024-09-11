import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_random/Models/Work_shifts_item.dart';
import 'package:new_random/presentation/Detail_screen/Detail_screen.dart';
import 'package:new_random/presentation/Persistence/Decoration_for_container.dart';
import 'package:new_random/services/hiveService/Hive_service.dart';

class WorkShiftsList extends StatefulWidget {
  const WorkShiftsList({super.key});

  @override
  State<WorkShiftsList> createState() => _WorkShiftsListState();
}

class _WorkShiftsListState extends State<WorkShiftsList> {
  @override
  void initState() {
    super.initState();
  }

  final _boxName = HiveService.boxNameWorkShiftsItem;
  final _hiveService = HiveService();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box<WorkShiftsItem>(_boxName).listenable(),
      builder: (BuildContext context, Box<WorkShiftsItem> box, Widget? child) {
        return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                  background: Container(
                    color: Colors.red[200],
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
                        box.values.toList()[index].title,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              workShifts: box.values.toList()[index],
                              workShiftsIndex: index,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  onDismissed: (direction) =>
                      _hiveService.deleteWorkShift(index: index));
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
