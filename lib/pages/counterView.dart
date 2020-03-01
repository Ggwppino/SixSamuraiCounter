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
import 'package:six_samurai_counter_app/classes/contatori.dart';
import 'package:six_samurai_counter_app/classes/lifePoints.dart';

import 'lifePointsView.dart';

class Data {
  List<LifePoints> player;

  Data(this.player);

}

class CounterListView extends StatefulWidget {
  CounterListView();
  _CounterListViewState createState() => _CounterListViewState();
}

class _CounterListViewState extends State<CounterListView> {
  final List<Contatori> _listViewData = [new Contatori('GATEWAY DUDE', 0, 2)];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  int _iteratorCounter = 1;
  final data = Data([new LifePoints('8000', 0), new LifePoints('8000', 0)]);



  Widget _buildListViewData() {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children:
      _listViewData.map((data) {
        return Dismissible(
          key: Key(data.name),
          onDismissed: (direction) {
            // Remove the item from the data source.
            setState(() {
              _listViewData.remove(data);
            });
          },
          child: ListTile(
            title: Text(data.name, style: _biggerFont),
            trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          data.counterSub();
                        });
                      }
                  ),
                  Text(data.counter.toString()),
                  IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          data.counterAdd();
                        });
                      }
                  )
                ]
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Six-Samurai Counter"),
        ),
        body: _buildListViewData(),
        drawer: DrawerList(context),
        floatingActionButton: FloatingActionButton(
            onPressed: _addTile,
            child: Icon(Icons.add)));
  }

  Widget DrawerList(BuildContext context){
    return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
                child: Row(
                  children:[
                    Image.asset('assets/images/Kizan.png',fit:BoxFit.fitHeight, scale:0.5, alignment: Alignment.bottomLeft),
                    Container(child:Text("Six-Samurai Counter",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)) )], ),
                decoration: BoxDecoration(color:Colors.blue),
                padding: const EdgeInsets.all(0.0)
            ),
            new ListTile(
                title: Text("Life Points Calculator"),
                trailing: Icon(Icons.dialpad),
                //enabled: false
              onTap:(){
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LifePointsView(data:data)));
              }
            ),
            new ListTile(
                title: Text("Roll Dice"),
                trailing: Icon(Icons.casino),
                onTap:(){
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/dice');}
            ),
            new ListTile(
              title: Text("About Six-Samurai Counter"),
              trailing: Icon(Icons.info),
              onTap: (){
                Navigator.pop(context);
                Navigator.pushNamed(context, '/info');}
              ,
            ),
          ],
        ));
  }

  void _addTile() {
    setState(() {
      _listViewData.add(
          new Contatori('counter ' + _iteratorCounter.toString(), 0, 1));
      _iteratorCounter++;
    });
  }
}