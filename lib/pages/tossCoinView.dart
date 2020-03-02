import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class TossCoinView extends StatefulWidget{
  _TossCoinViewState createState()=> _TossCoinViewState();
}

class _TossCoinViewState extends State<TossCoinView>{
  int _coinNumber=0;

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Coin"),
        ),
        body: Center(
          child: GestureDetector(
            child:Image.asset('assets/images/Coin/Coin-$_coinNumber.png', scale: 3),
            onTap: (){
              HapticFeedback.lightImpact();
              setState(() {
                _coinNumber= Random().nextInt(2)+1;
              });
            },
          ),

        )
    );
  }
}
