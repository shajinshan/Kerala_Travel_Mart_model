import 'package:flutter/material.dart';

import '../../colors/asserts.dart';

class CustomLinearProcessIndicator extends StatefulWidget {
  const CustomLinearProcessIndicator({super.key});

  @override
  State<CustomLinearProcessIndicator> createState() =>
      _CustomLinearProcessIndicatorState();
}

class _CustomLinearProcessIndicatorState
    extends State<CustomLinearProcessIndicator> {
  double progress = 0.0;

  Future<void> loading() async {
    for (int i = 1; i < 100; i++) {
      await Future.delayed(Duration(milliseconds: 10));
      setState(() {
        progress = i / 100;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    loading();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 80,
        width: 250,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 235, 234, 232),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sync Data",
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  value: progress,
                  backgroundColor: const Color.fromARGB(255, 234, 234, 234),
                  valueColor: const AlwaysStoppedAnimation(GlobalColor.color),
                )),
          ],
        ),
      ),
    );
  }
}
