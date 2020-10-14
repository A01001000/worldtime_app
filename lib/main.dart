import 'package:flutter/material.dart';
import 'package:worldtime_app/pages/home.dart';
import 'package:worldtime_app/pages/loading.dart';
import 'package:worldtime_app/pages/choose_location.dart';
import 'package:worldtime_app/pages/choose_sleep_time.dart';

void main() => runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => ChooseLocation(),
      '/sleeptime': (context) => ChooseSleepTime(),
    }
  ));


