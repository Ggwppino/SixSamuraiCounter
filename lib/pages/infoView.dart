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
import 'package:package_info/package_info.dart';

class InfoView extends StatefulWidget {
  _InfoViewState createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  String _version = '';

  initState() {
    super.initState();
    getVersion();
  }

  getVersion() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _version = packageInfo.version;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Six-Samurai Counter, v$_version")),
          Center(child: Text("Copyright(C) 2020 Ggwppino"))
        ],
      ),
    );
  }
}
