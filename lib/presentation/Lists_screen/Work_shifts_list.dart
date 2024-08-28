import 'package:flutter/material.dart';
import 'package:new_random/Models/Work_shifts_item.dart';
import 'package:new_random/presentation/Detail_screen/Detail_screen.dart';
import 'package:new_random/presentation/Persistence/Decoration_for_container.dart';
import 'package:new_random/repository/Work_shifts_repo.dart';

class WorkShiftsList extends StatefulWidget {
  const WorkShiftsList({super.key});

  @override
  State<WorkShiftsList> createState() => _WorkShiftsListState();
}

class _WorkShiftsListState extends State<WorkShiftsList> {
  final WorkShiftsRepo _workShiftsRepo = WorkShiftsRepo();

  late WorkShiftsItem _weekEnd;
  late WorkShiftsItem _midWeek;
  late WorkShiftsItem _startWeek;
  late WorkShiftsItem _secondFloor;
  late WorkShiftsItem _onlyOne;
  late WorkShiftsItem _fourPeople;

  List<WorkShiftsItem> _listDays = [];

  @override
  void initState() {
    _weekEnd = _workShiftsRepo.getWeekend();
    _midWeek = _workShiftsRepo.getMidWeek();
    _startWeek = _workShiftsRepo.getStartWeek();
    _secondFloor = _workShiftsRepo.getOnltSecondFloor();
    _onlyOne = _workShiftsRepo.getOnlyOne();
    _fourPeople = _workShiftsRepo.getFourBartenders();

    _listDays = [
      _startWeek,
      _midWeek,
      _weekEnd,
      _secondFloor,
      _onlyOne,
      _fourPeople
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return Container(
            decoration: DecorationForContainer.decoration,
            child: ListTile(
              title: Text(
                _listDays[index].title,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(workShifts: _listDays[index]),
                  ),
                );
              },
            ),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
        itemCount: _listDays.length);
  }
}
