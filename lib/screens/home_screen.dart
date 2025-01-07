import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const int initSeconds = 25 * 60;

  int totalSeconds = initSeconds;
  int pomodoroCnt = 0;
  bool isRunning = false;
  late Timer timer;

  void onTimerPressed() {
    if (isRunning) {
      cancelTimer();
      return;
    }

    timer = Timer.periodic(const Duration(milliseconds: 1), tick);

    setState(() {
      isRunning = true;
    });
  }

  void cancelTimer() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void tick(Timer timer) {
    if (totalSeconds <= 0) {
      onTimerReset();
      setState(() {
        pomodoroCnt++;
      });

      return;
    }

    setState(() {
      totalSeconds--;
    });
  }

  void onTimerReset() {
    cancelTimer();
    setState(() {
      totalSeconds = initSeconds;
    });
  }

  void onCounterReset() {
    setState(() {
      pomodoroCnt = 0;
    });
  }

  String formatSeconds(int totalSeconds) {
    String padZero(int n) => n.toString().padLeft(2, "0");

    return "${padZero(totalSeconds ~/ 60)}:${padZero(totalSeconds % 60)}";
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
                formatSeconds(totalSeconds),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      isRunning
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline,
                      size: 80,
                      color: Theme.of(context).cardColor,
                    ),
                    onPressed: onTimerPressed,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.restore_outlined,
                      size: 80,
                      color: Theme.of(context).cardColor,
                    ),
                    onPressed: onTimerReset,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.restore_page_outlined,
                      size: 80,
                      color: Theme.of(context).cardColor,
                    ),
                    onPressed: onCounterReset,
                  ),
                ],
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
