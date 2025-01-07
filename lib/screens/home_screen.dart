import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int totalSeconds = 60 * 25;
  static const int initSeconds = 3;
  int totalSeconds = initSeconds;
  int pomodoroCnt = 0;
  late Timer timer;

  void onTick(Timer timer) {
    setState(() {
      if (totalSeconds <= 0) {
        timer.cancel();
        totalSeconds = initSeconds;
        pomodoroCnt++;

        return;
      }

      totalSeconds--;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                "${(totalSeconds / 60).floor().toString().padLeft(2, '0')}:${(totalSeconds % 60).toString().padLeft(2, '0')}",
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 90,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: IconButton(
                icon: Icon(
                  Icons.play_circle_outline,
                  size: 120,
                  color: Theme.of(context).cardColor,
                ),
                onPressed: onStartPressed,
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .color,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "$pomodoroCnt",
                          style: TextStyle(
                            color: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .color,
                            fontSize: 60,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
