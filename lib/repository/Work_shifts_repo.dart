import 'package:new_random/Models/Work_shifts_item.dart';
import 'package:new_random/services/hiveService/Hive_service.dart';

class WorkShiftsRepo {
  static final WorkShiftsRepo _singleton = WorkShiftsRepo._internal();

  factory WorkShiftsRepo() {
    return _singleton;
  }

  WorkShiftsRepo._internal();

  List<WorkShiftsItem> getWorkShifts() {
    List<WorkShiftsItem> workshifts = [];

    HiveService().getWorkShifts().then((value) {
      workshifts = value;
      print(workshifts);
    });
    return workshifts;
  }
}
