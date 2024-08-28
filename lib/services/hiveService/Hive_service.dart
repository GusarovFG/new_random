import 'package:hive/hive.dart';
import 'package:new_random/Models/Bartenders_Item.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveService {
  static String boxNameForBartendersItem = 'newRandomBartenders';

  static Future<Box<BartendersItem>> get _bartendersBox async =>
      await Hive.box(HiveService.boxNameForBartendersItem);

  static init() async {
    final applicationDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();

    Hive
      ..init(applicationDocumentDir.path)
      ..registerAdapter(BartendersItemAdapter());

    await Hive.openBox<BartendersItem>(HiveService.boxNameForBartendersItem);
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
}
