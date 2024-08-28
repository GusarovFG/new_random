import 'package:hive/hive.dart';

part 'Bartenders_Item.g.dart';

@HiveType(typeId: 0)
class BartendersItem {
  BartendersItem({required this.bartender});

  @HiveField(0)
  String bartender;
}
