import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/screens/currency.dart';
import 'package:flutter_learn/screens/timer.dart';
import 'package:flutter_learn/screens/webtoon_home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // runApp(const CurrencyApp());
  // runApp(const TimerApp());

  await dotenv.load(fileName: ".env");
  runApp(const WebtoonApp());
}
