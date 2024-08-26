import 'package:hive/hive.dart';
import 'package:new_random/Models/Work_shift_item.dart';

class HiveServiceForWorkShifts {
  static String boxName = 'newRandom';
  static Future<Box<WorkShiftItem>> get _box async =>
      await Hive.box(HiveServiceForWorkShifts.boxName);
}
