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

import 'dart:core';

class LifePoints {
  String _value;
  int _countParentheses;
  static const double infinity = 1.0 / 0.0;

  LifePoints(value, count) {
    this._value = value;
    this._countParentheses = count;
  }

  String getValue() {
    return this._value;
  }

  int getCount() {
    return _countParentheses;
  }

  setValue(String value) {
    _value = value;
  }

  add() {
    if (!_compareParseOpenParenthesis() && this._value.length < 45) {
      if(_compareParseSign()) delete();
      this._value += '+';
    }
  }

  sub() {
    if (!_compareParseOpenParenthesis() && this._value.length < 45) {
      if(_compareParseSign()) delete();
      this._value += '-';
    }
  }

  div() {
    if (!_compareParseOpenParenthesis() && this._value.length < 45){
      if(_compareParseSign()) delete();
      this._value += '÷';
    }
  }

  mul() {
    if (!_compareParseOpenParenthesis() && this._value.length < 45){
      if(_compareParseSign()) delete();
      this._value += '×';
    }
  }

  insertNumber(int number) {
    if (this._value.length < 46)
      if (number != 0 ||
        this._value.codeUnitAt(this._value.length - 1) != '÷'.codeUnitAt(0)) {
      if (this._value == '0')
        this._value = number.toString();
      else if (_compareParseCloseParenthesis())
        this._value += '×' + number.toString();
      else
        this._value += number.toString();
    }
  }

  insert00() {
    if (_compareParseNumber() && this._value != '0' && this._value.length < 45)
      this._value += '00';
  }

  openParenthesis() {
    if(this._value.length<45) {
      if (_compareParseNumber() || _compareParseCloseParenthesis()) this._value += '×';
      this._value += '(';
      this._countParentheses++;
    }
  }

  closeParenthesis() {
    if (!_compareParseSign() && !_compareParseOpenParenthesis() && this._value.length<46) {
      this._value += ')';
      this._countParentheses--;
    }
  }

  go() {
    if (!_compareParseSign()) _solve();
  }

  delete() {
    if (this._value.length - 1 != 0) {
      if (_compareParseOpenParenthesis())
        this._countParentheses--;
      else if (_compareParseCloseParenthesis()) this._countParentheses++;
      this._value = this._value.substring(0, this._value.length - 1);
    } else
      this._value = '0';
  }

  deleteAll() {
    this._value = '8000';
    this._countParentheses = 0;
  }

  bool _compareParseSign() {
    int l = this._value.length - 1;
    if (this._value.codeUnitAt(l) == '÷'.codeUnitAt(0) ||
        this._value.codeUnitAt(l) == '-'.codeUnitAt(0) ||
        this._value.codeUnitAt(l) == '×'.codeUnitAt(0) ||
        this._value.codeUnitAt(l) == '+'.codeUnitAt(0))
      return true;
    else
      return false;
  }

  bool _compareParseOpenParenthesis() {
    int l = this._value.length - 1;
    if (this._value.codeUnitAt(l) == '('.codeUnitAt(0))
      return true;
    else
      return false;
  }

  bool _compareParseCloseParenthesis() {
    int l = this._value.length - 1;
    if (this._value.codeUnitAt(l) == ')'.codeUnitAt(0))
      return true;
    else
      return false;
  }

  bool _compareParseNumber() {
    int l = this._value.length - 1;
    if (this._value.codeUnitAt(l) >= '0'.codeUnitAt(0) &&
        this._value.codeUnitAt(l) <= '9'.codeUnitAt(0)) return true;
    return false;
  }

  //solve using a "stack"
  _solve() {
    List<String> stack = new List<String>();
    List<String> tmp;
    for (int i = 0; i < this._value.length; i++) {
      if (this._value[i] == ')') {
        tmp = _procedure(stack).reversed.toList();
        while (tmp.isNotEmpty) stack.add(tmp.removeLast());
      } else {
        stack.add(this._value[i]);
      }
    }
    String temp;
    temp = this._solution(stack).join();
    if (int.parse(temp) <= 0)
      this._value = '0';
    else
      this._value = temp;
  }


  //sub exp with '(' and ')'
  List<String> _procedure(List<String> stack) {
    List<String> stackAppoggio = new List<String>();
    while (stack.last != '(') stackAppoggio.add(stack.removeLast());
    stack.removeLast();
    return _solution(stackAppoggio.reversed.toList());
  }

  //calculate expression and return solution in a list<String>
  List<String> _solution(List<String> stack) {
    String temp = stack.join();
    if (temp.contains('+')) {
      List<String> array = temp.replaceFirst('+', '&').split('&');
      return (int.parse(_solution(array[0].split('')).join()) +
              int.parse(_solution(array[1].split('')).join()))
          .toString()
          .split('');
    } else if (temp.contains('-')) {
      List<String> array = temp.replaceFirst('-', '&').split('&');
      return (int.parse(_solution(array[0].split('')).join()) -
              int.parse(_solution(array[1].split('')).join()))
          .toString()
          .split('');
    } else if (temp.contains('×')) {
      List<String> array = temp.replaceFirst('×', '&').split('&');
      return (int.parse(_solution(array[0].split('')).join()) *
              int.parse(_solution(array[1].split('')).join()))
          .toString()
          .split('');
    } else if (temp.contains('÷')) {
      List<String> array = temp.replaceFirst('÷', '&').split('&');
      double tmpDouble1 = double.parse(_solution(array[0].split('')).join());
      double tmpDouble2 = double.parse(_solution(array[1].split('')).join());
      return (tmpDouble1 / tmpDouble2).ceil().toString().split('');
    } else
      return temp.split('');
  }
}
