import 'package:new_random/Models/Bartenders_Item.dart';
import 'package:new_random/services/hiveService/Hive_service.dart';

class BartenderRepository {
  static final BartenderRepository _singleton = BartenderRepository._internal();

  factory BartenderRepository() {
    return _singleton;
  }

  BartenderRepository._internal();

  List<BartendersItem> getBartenders() {
    List<BartendersItem> bartennders = [];
    HiveService().getBartenders().then((value) {
      bartennders = value;
    });
    return bartennders;
  }
}
