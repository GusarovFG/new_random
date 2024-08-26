import 'package:hive/hive.dart';

part 'Bartenders_Item.g.dart';

@HiveType(typeId: 0)
class BartendersItem {
  BartendersItem({required this.bartenders});

  @HiveField(0)
  List<String> bartenders;
}
