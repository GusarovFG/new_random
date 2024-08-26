import 'package:hive/hive.dart';
import 'package:new_random/Models/Bartenders_Item.dart';

class HiveServiceForBartenders {
  static String boxName = 'newRandom';
  static Future<Box<BartendersItem>> get _box async =>
      await Hive.box(HiveServiceForBartenders.boxName);
}
