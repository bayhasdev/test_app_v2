import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class SpinningWheelPage extends StatefulWidget {
  const SpinningWheelPage();
  @override
  _SpinningWheelPageState createState() => _SpinningWheelPageState();
}

class _SpinningWheelPageState extends State<SpinningWheelPage> {
  StreamController<int> selectedStreamController = StreamController<int>();
  late Stream<int> selectedStream;
  int selectedValue = 0;

  late List<WheelModel> items;

  @override
  void initState() {
    super.initState();
    items = _buildRandomItems();
    selectedStreamController.onListen = () {
      log('on listen');
    };
    selectedStream = selectedStreamController.stream.asBroadcastStream();
    selectedStream.listen((event) {
      log('event :$event');
      setState(() {
        selectedValue = event;
      });
    });
  }

  @override
  void dispose() {
    selectedStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Fortune Wheel'),
      ),
      body: ListView(
        children: [
          ElevatedButton(onPressed: _spinTheWheel, child: Text('Spinn')),
          SizedBox(
            height: 300,
            child: GestureDetector(
              onTap: _spinTheWheel,
              child: Column(
                children: [
                  Expanded(
                    child: FortuneWheel(
                      alignment: Alignment.bottomCenter,
                      indicators: const [
                        FortuneIndicator(alignment: Alignment.bottomCenter, child: TriangleIndicator(color: Colors.red)),
                      ],
                      selected: selectedStream,
                      items: [
                        for (var it in items)
                          FortuneItem(
                            child: Image.asset('assets/images/${it.image}', width: 60),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          Text(items[selectedValue].value.toString()),
          Text(items[selectedValue].image.toString()),
        ],
      ),
    );
  }

  void _spinTheWheel() {
    setState(() {
      int value = Fortune.randomInt(0, items.length);
      log('nex index will : $value');
      selectedStreamController.add(value);
    });
  }

  List<WheelModel> _buildRandomItems() {
    var images = ['american_express.png', 'caugh.png', 'ddd.png', 'discover.png', 'fever.png', 'jcb.png'];
    return List.generate(6, (index) => WheelModel(id: index, value: (index + 1) * math.Random().nextInt(9).toDouble() * 100, image: images[index]));
  }
}

class WheelModel {
  int? id;
  String? image;
  double? value;
  WheelModel({this.id, this.image, this.value});
}
