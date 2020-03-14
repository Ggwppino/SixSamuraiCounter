import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:six_samurai_counter_app/pages/tossCoinView.dart';

import 'pages/counterView.dart';
import 'pages/diceView.dart';
import 'pages/infoView.dart';
import 'pages/lifePointsView.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
   Color themeColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp
    ]);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark
      ));
    return MaterialApp(
      title: 'SixSamuraiCounter',
      theme: ThemeData(
        primarySwatch: themeColor,
        brightness: Brightness.light
      ),
      home: CounterListView(),
      routes: <String, WidgetBuilder>{
        '/info': (context)=> InfoView(),
        '/dice': (context)=> DiceView(),
        '/lifepoints': (context)=>LifePointsView(),
        '/coin': (context)=>TossCoinView()
      }
    );
  }
}
