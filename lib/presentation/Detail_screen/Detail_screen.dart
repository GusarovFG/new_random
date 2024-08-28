import 'package:flutter/material.dart';
import 'package:new_random/Models/Bartenders_Item.dart';
import 'package:new_random/Models/Work_shifts_item.dart';
import 'package:new_random/presentation/Detail_screen/Detail_list_tile.dart';
import 'package:new_random/presentation/Persistence/Decoration_for_container.dart';
import 'package:new_random/services/hiveService/Hive_service.dart';
import 'package:pattern_background/pattern_background.dart';

class DetailScreen extends StatefulWidget {
  final WorkShiftsItem workShifts;

  const DetailScreen({super.key, required this.workShifts});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final HiveService _hive = HiveService();
  late List<BartendersItem> _bartenders = [];
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
                flex: 2,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return (isRandom && index == 4)
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
                                  : null,
                            );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                          height: 15,
                        ),
                    itemCount: widget.workShifts.zones.length),
              ),
              Expanded(
                flex: 1,
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
                            child: const Center(child: Text('удалить')),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
