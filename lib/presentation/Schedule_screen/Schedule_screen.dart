import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_random/Models/Bartenders_Item.dart';
import 'package:new_random/presentation/Persistence/Decoration_for_container.dart';
import 'package:new_random/presentation/Schedule_screen/checkbox.dart';
import 'package:new_random/presentation/persistence/Bar_appBar.dart';
import 'package:new_random/services/hiveService/Hive_service.dart';
import 'package:pattern_background/pattern_background.dart';
import 'package:share_screenshot_widget/share_screenshot_widget.dart'
    as sharing;

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final boxName = HiveService.boxNameForBartendersItem;

    var c1 = Colors.grey.shade900;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return sharing.ShareScreenshotAsImage(
      globalKey: globalKey,
      child: Scaffold(
          appBar: const BarAppBar(
              nameOfAsset: 'assets/gtafik.png', revision: false),
          body: CustomPaint(
            size: Size(width, height),
            painter: DotPainter(dotColor: c1, dotRadius: 2, spacing: 5),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7, right: 7),
                  child: Container(
                    decoration: DecorationForContainer.decoration,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          height: 50,
                          width: 80,
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 7, right: 7),
                                  child: Text('ПН')),
                              Padding(
                                  padding: EdgeInsets.only(left: 7, right: 7),
                                  child: Text('ВТ')),
                              Padding(
                                  padding: EdgeInsets.only(left: 7, right: 7),
                                  child: Text('СР')),
                              Padding(
                                  padding: EdgeInsets.only(left: 7, right: 7),
                                  child: Text('ЧТ')),
                              Padding(
                                  padding: EdgeInsets.only(left: 7, right: 7),
                                  child: Text('ПТ')),
                              Padding(
                                  padding: EdgeInsets.only(left: 7, right: 7),
                                  child: Text('СБ')),
                              Padding(
                                  padding: EdgeInsets.only(left: 7, right: 7),
                                  child: Text('ВС')),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable:
                        Hive.box<BartendersItem>(boxName).listenable(),
                    builder: (BuildContext context, Box<BartendersItem> box,
                        Widget? child) {
                      return ListView.separated(
                          padding: const EdgeInsets.only(left: 7, right: 7),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: DecorationForContainer.decoration,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 80,
                                    child: Center(
                                      child: Text(
                                        box.values.toList()[index].bartender,
                                        style: const TextStyle(fontSize: 15),
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: List.generate(
                                        7,
                                        (index) => const Padding(
                                          padding: EdgeInsets.only(
                                              left: 7, right: 7),
                                          child: DayCheckbox(),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(
                                height: 15,
                              ),
                          itemCount: box.values.toList().length);
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 196, 36, 196),
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  child: IconButton(
                    color: Colors.white,
                    onPressed: () {
                      sharing.shareWidgets(globalKey: globalKey);
                    },
                    icon: const Icon(Icons.ios_share_sharp),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )),
    );
  }
}
