import 'package:hive/hive.dart';
import 'package:new_random/Models/Bartenders_Item.dart';
import 'package:new_random/Models/Work_shift_item.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveService {
  static String boxNameForBartendersItem = 'newRandomBartenders';
  static String boxNameForWorkShifts = 'newRandomWorkShifts';

  static init() async {
    final applicationDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();

    Hive
      ..init(applicationDocumentDir.path)
      ..registerAdapter(BartendersItemAdapter())
      ..registerAdapter(WorkShiftItemAdapter())
      ..openBox<BartendersItem>(HiveService.boxNameForBartendersItem)
      ..openBox<WorkShiftItem>(HiveService.boxNameForBartendersItem);
  }
}
