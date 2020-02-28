import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class DiceView extends StatefulWidget{
  _DiceViewState createState()=> _DiceViewState();
}

class _DiceViewState extends State<DiceView>{
  int _diceNumber=0;

  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(
          title: Text("Dado"),
        ),
        body: Center(
          child: GestureDetector(
            child:Image.asset('assets/images/Dice/Dice-$_diceNumber.png'),
            onTap: (){
              setState(() {
                _diceNumber= Random().nextInt(6)+1;
              });
            },
          ),

        )
    );
  }
}
