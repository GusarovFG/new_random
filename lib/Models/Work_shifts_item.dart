import 'package:hive/hive.dart';

part 'Work_shifts_item.g.dart';

@HiveType(typeId: 1)
class WorkShiftsItem {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final List<String> zones;

  WorkShiftsItem({required this.title, required this.zones});
}
