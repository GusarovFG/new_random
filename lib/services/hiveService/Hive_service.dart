import 'package:hive/hive.dart';
import 'package:new_random/Models/Bartenders_Item.dart';
import 'package:new_random/Models/Work_shifts_item.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveService {
  static String boxNameForBartendersItem = 'newRandomBartenders';
  static String boxNameWorkShiftsItem = 'newRandomWorkShifts';

  static Future<Box<BartendersItem>> get _bartendersBox async =>
      Hive.box(HiveService.boxNameForBartendersItem);

  static Future<Box<WorkShiftsItem>> get _workShiftsBox async =>
      Hive.box(HiveService.boxNameWorkShiftsItem);

  static init() async {
    final applicationDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();

    Hive
      ..init(applicationDocumentDir.path)
      ..registerAdapter(BartendersItemAdapter())
      ..registerAdapter(WorkShiftsItemAdapter());

    await Hive.openBox<BartendersItem>(HiveService.boxNameForBartendersItem);
    await Hive.openBox<WorkShiftsItem>(HiveService.boxNameWorkShiftsItem);
  }

  Future<List<BartendersItem>> getBartenders() async {
    final box = await _bartendersBox;
    return box.values.toList();
  }

  Future<void> addBartender({required BartendersItem bartender}) async {
    final box = await _bartendersBox;
    box.add(bartender);
  }

  Future<void> deleteBartender({required int index}) async {
    final box = await _bartendersBox;
    box.deleteAt(index);
  }

  Future<void> updateBartender(
      {required BartendersItem bartender, required int index}) async {
    final box = await _bartendersBox;
    box.putAt(index, bartender);
  }

  Future<List<WorkShiftsItem>> getWorkShifts() async {
    final box = await _workShiftsBox;
    return box.values.toList();
  }

  Future<void> addWorkShift({required WorkShiftsItem workShift}) async {
    final box = await _workShiftsBox;
    box.add(workShift);
  }

  Future<void> deleteWorkShift({required int index}) async {
    final box = await _workShiftsBox;
    box.deleteAt(index);
  }

  Future<void> updateWorkShift(
      {required WorkShiftsItem workShift, required int index}) async {
    final box = await _workShiftsBox;
    box.putAt(index, workShift);
  }

  Future<void> addZoneForWorkShift(
      {required WorkShiftsItem workShift,
      required int index,
      required String zone}) async {
    final box = await _workShiftsBox;
    final thisWorkShift = box.values.toList()[index];
    final zones = thisWorkShift.zones;

    zones.add(zone);

    final newWorkShift =
        WorkShiftsItem(title: thisWorkShift.title, zones: zones);
    box.putAt(index, newWorkShift);
  }

  Future<void> deleteZoneForWorkShift(
      {required WorkShiftsItem workShift,
      required int index,
      required String zone}) async {
    final box = await _workShiftsBox;
    final thisWorkShift = box.values.toList()[index];
    final zones = thisWorkShift.zones;

    zones.remove(zone);

    final newWorkShift =
        WorkShiftsItem(title: thisWorkShift.title, zones: zones);
    box.putAt(index, newWorkShift);
  }
}
