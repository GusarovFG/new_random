import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:new_random/Models/Bartenders_Item.dart';
import 'package:new_random/Models/Work_shifts_item.dart';
import 'package:new_random/presentation/Detail_screen/Detail_list_tile.dart';
import 'package:new_random/presentation/Main_screen/Add_zone_dialog.dart';
import 'package:new_random/presentation/Persistence/Decoration_for_container.dart';
import 'package:new_random/services/hiveService/Hive_service.dart';
import 'package:pattern_background/pattern_background.dart';

class DetailScreen extends StatefulWidget {
  final WorkShiftsItem workShifts;
  final int workShiftsIndex;

  const DetailScreen({
    super.key,
    required this.workShifts,
    required this.workShiftsIndex,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final HiveService _hive = HiveService();
  late List<BartendersItem> _bartenders = [];
  final _boxName = HiveService.boxNameWorkShiftsItem;
  String service = '';
  bool isRandom = false;

  @override
  void initState() {
    getBartenders();
    super.initState();
  }

  void getBartenders() {
    _hive.getBartenders().then((onValue) {
      setState(() {
        _bartenders = onValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var c1 = Colors.grey.shade900;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.workShifts.title,
          style: const TextStyle(height: 10),
        ),
      ),
      body: CustomPaint(
        size: Size(width, height),
        painter: DotPainter(dotColor: c1, dotRadius: 2, spacing: 5),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: ValueListenableBuilder(
                  valueListenable:
                      Hive.box<WorkShiftsItem>(_boxName).listenable(),
                  builder: (BuildContext context, Box<WorkShiftsItem> box,
                      Widget? child) {
                    return ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Dismissible(
                            background: Container(
                              color: Colors.red[200],
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [Text('удалить'), Text('удалить')],
                              ),
                            ),
                            key: UniqueKey(),
                            child: Container(
                              decoration: DecorationForContainer.decoration,
                              child: (isRandom && index == 4)
                                  ? DetailListTile(
                                      workShift: widget.workShifts.zones[index],
                                      bartender: (isRandom && index == 4)
                                          ? service
                                          : _bartenders[index].bartender,
                                    )
                                  : DetailListTile(
                                      workShift: widget.workShifts.zones[index],
                                      bartender: isRandom
                                          ? _bartenders[index].bartender
                                          : '',
                                    ),
                            ),
                            onDismissed: (direction) =>
                                _hive.deleteZoneForWorkShift(
                                    index: widget.workShiftsIndex,
                                    workShift: widget.workShifts,
                                    zone: widget.workShifts.zones[index]),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) =>
                            const SizedBox(
                              height: 15,
                            ),
                        itemCount: box.values
                            .toList()[widget.workShiftsIndex]
                            .zones
                            .length);
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                flex: 2,
                child: GridView.count(
                  childAspectRatio: 4,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: List.generate(_bartenders.length, (index) {
                    return GestureDetector(
                      child: Container(
                        width: 100,
                        height: 50,
                        decoration: DecorationForContainer.decoration,
                        child: Dismissible(
                          key: UniqueKey(),
                          background: Container(
                            color: Colors.red[200],
                            child: const Center(
                              child:
                                  Text('удалить', textAlign: TextAlign.center),
                            ),
                          ),
                          onDismissed: (direction) {
                            setState(() {
                              _bartenders.removeAt(index);
                              isRandom = false;
                            });
                          },
                          child: Center(
                              child: Text(
                            _bartenders[index].bartender,
                            textAlign: TextAlign.center,
                          )),
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (widget.workShifts.zones.length == 5) {
                            service = _bartenders[index].bartender;
                            _bartenders.removeAt(index);
                            _bartenders.shuffle();
                            _bartenders.add(BartendersItem(bartender: service));

                            isRandom = true;
                            return;
                          }
                          _bartenders.shuffle();
                          isRandom = true;
                        });
                      },
                    );
                  }),
                ),
              ),
              Container(
                decoration: DecorationForContainer.decoration,
                child: IconButton(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  onPressed: () {
                    setState(() {
                      getBartenders();
                    });
                  },
                  icon: const Icon(Icons.refresh),
                ),
              ),
              Container(
                decoration: DecorationForContainer.decoration,
                child: IconButton(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AddZoneDialog(
                        workShiftItem: widget.workShifts,
                        index: widget.workShiftsIndex,
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
