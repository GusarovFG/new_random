import 'package:flutter/material.dart';
import 'package:new_random/presentation/Main_screen/Main_screen.dart';
import 'package:pattern_background/pattern_background.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    var c1 = Colors.grey.shade900;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'pixel'),
      home: Scaffold(
        appBar: AppBar(
          title: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 2,

                    offset: Offset(8, 10), // changes position of shadow
                  ),
                ],
              ),
              child: const Text('Жребий')),
          centerTitle: true,
        ),
        body: CustomPaint(
            size: Size(width, height),
            painter: DotPainter(dotColor: c1, dotRadius: 2, spacing: 5),
            child: const MainScreen()),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black,
              width: 3,
            ),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 2,

                offset: Offset(8, 10), // changes position of shadow
              ),
            ],
          ),
          child: BottomNavigationBar(
            useLegacyColorScheme: false,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Списки'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.watch_later_outlined), label: 'График')
            ],
          ),
        ),
      ),
    );
  }
}
