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

class InfoView extends StatefulWidget{
  _InfoViewState createState()=> _InfoViewState();
}

class _InfoViewState extends State<InfoView>{
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informazioni"),
      ),
      body: Center(
        child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: [
              Center(child:Text("Six-Samurai Counter, V1.0.0")),
              Center(child:Text("Copyright(C) 2020 Ggwppino"))
            ]
        ) ,
      ),

    );

  }
}