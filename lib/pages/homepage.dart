import 'package:flutter/material.dart';
import 'package:ubit/pages/numbers.dart';
import 'package:collection/collection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();

  void onChange(int) {}
}

class _HomeScreenState extends State<HomeScreen> {
  int _height = 5;
  int _weight = 50;
  int gpa = 0;
  List<num> list = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: ElevatedButton(
            onPressed: () {
              calculate();
            },
            child: Text('calculate')),
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              _height.toString(),
              style: const TextStyle(fontSize: 40),
            ),
            Slider(
              min: 0,
              max: 10,
              value: _height.toDouble(),
              thumbColor: Colors.red,
              onChanged: (value) {
                setState(() {
                  _height = value.toInt();
                });
                widget.onChange(_height);
              },
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _height,
                itemBuilder: (context, index) {
                  return AgeWeightWidget(
                      onChange: (weightVal) {
                        list.add(weightVal);
                      },
                      title: 'numbers',
                      initValue: 50,
                      min: 0,
                      max: 100);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void calculate() {
    print(list);
  }
}
