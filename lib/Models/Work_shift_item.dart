import 'package:hive/hive.dart';

part 'Work_shift_item.g.dart';

@HiveType(typeId: 1)
class WorkShiftItem {
  WorkShiftItem({required this.workShifts});

  @HiveField(0)
  List<String> workShifts;
}
