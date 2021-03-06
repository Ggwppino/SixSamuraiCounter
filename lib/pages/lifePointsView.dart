/*
  This file is part of Six-Samurai Counter
  Copyright (C) 2020 Ggwppino

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:six_samurai_counter_app/classes/lifePoints.dart';

import 'counterView.dart';

class LifePointsView extends StatefulWidget {
  final Data data;
  LifePointsView({this.data});
  _LifePointsViewState createState() => _LifePointsViewState(this.data.player);
}

class _LifePointsViewState extends State<LifePointsView> {
  _LifePointsViewState(this._playerData);
  final List<LifePoints> _playerData;
  int _currentPlayer=0;
  double _fontPlayer1 = 30.0;
  double _fontPlayer2 = 20.0;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "CE") {
        _playerData[_currentPlayer].delete();
      } else if(buttonText == "⤿"){
        _playerData[0].deleteAll();
        _playerData[1].deleteAll();
      } else if (buttonText == "=") {
        _playerData[_currentPlayer].go();
      } else if (buttonText == "+") {
        _playerData[_currentPlayer].add();
      } else if (buttonText == "-") {
        _playerData[_currentPlayer].sub();
      } else if (buttonText == "×") {
        _playerData[_currentPlayer].mul();
      } else if (buttonText == "÷") {
        _playerData[_currentPlayer].div();
      } else if (buttonText == "(") {
        _playerData[_currentPlayer].openParenthesis();
      } else if (buttonText == ")") {
        _playerData[_currentPlayer].closeParenthesis();
      } else if (buttonText == "00") {
        _playerData[_currentPlayer].insert00();
      } else {
        _playerData[_currentPlayer].insertNumber(int.parse(buttonText));
      }
    });
  }

  Widget buildButton(String buttonText, Color buttonColor,
      Color textColor) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.1,
        color: buttonColor,
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
            side: BorderSide(
                color: buttonColor, width: 1, style: BorderStyle.solid),
          ),
          padding: EdgeInsets.all(15.0),
          onPressed: () => buttonPressed(buttonText),
          child: Text(buttonText,
              style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.normal,
                  color: textColor)),
        ));
  }

  Widget _buildLifePointsViewData() {
    return Column(
      children: <Widget>[
        GestureDetector(
            onTap: () {
              setState(() {
                _currentPlayer = 0;
                _fontPlayer1 = 30.0;
                _fontPlayer2 = 20.0;
              });
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 40, 10, 10),
              child: Text(_playerData[0].getValue(),
                  style: TextStyle(fontSize: _fontPlayer1)),
            )),
        Expanded(child: Divider()),
        GestureDetector(
            onTap: () {
              setState(() {
                _currentPlayer = 1;
                _fontPlayer1 = 20.0;
                _fontPlayer2 = 30.0;
              });
            },
            behavior: HitTestBehavior.translucent,
            child: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Text(_playerData[1].getValue(),
                  style: TextStyle(fontSize: _fontPlayer2)),
            )),
        Expanded(child: Divider()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .75,
              child: Table(
                children: [
                  TableRow(
                    children: [
                      buildButton("(", Colors.white10, Colors.black),
                      buildButton(")", Colors.white10, Colors.black),
                      buildButton("÷", Colors.white10, Colors.black),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("7", Colors.white, Colors.black),
                      buildButton("8", Colors.white, Colors.black),
                      buildButton("9", Colors.white, Colors.black),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("4", Colors.white, Colors.black),
                      buildButton("5", Colors.white, Colors.black),
                      buildButton("6", Colors.white, Colors.black),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("1", Colors.white, Colors.black),
                      buildButton("2", Colors.white, Colors.black),
                      buildButton("3", Colors.white, Colors.black),
                    ],
                  ),
                  TableRow(
                    children: [
                      buildButton("00", Colors.white, Colors.black),
                      buildButton("0", Colors.white, Colors.black),
                      GestureDetector(
                          onLongPress: () {
                            HapticFeedback.lightImpact();
                            setState(() {
                              _playerData[_currentPlayer].deleteAll();
                            });
                          },
                          child:
                              buildButton("CE", Colors.white, Colors.black)),
                    ],
                  ),
                ],
              ),
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Table(children: [
                  TableRow(children: [
                    buildButton("⤿", Colors.white10, Colors.black),
                  ]),
                  TableRow(children: [
                    buildButton("×", Colors.white10, Colors.black),
                  ]),
                  TableRow(children: [
                    buildButton("-", Colors.white10, Colors.black),
                  ]),
                  TableRow(children: [
                    buildButton("+", Colors.white10, Colors.black),
                  ]),
                  TableRow(children: [
                    buildButton("=", Colors.blue, Colors.white),
                  ]),
                ]))
          ],
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LifePoints"),
      ),
      body: _buildLifePointsViewData(),
    );
  }
}

