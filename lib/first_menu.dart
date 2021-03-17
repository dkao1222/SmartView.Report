import 'dart:convert';

import 'package:flutter/material.dart';
import 'login_page.dart';
import 'sign_in.dart';
import 'dash_board.dart';
//import '_google_sheets.dart';
import '_google_sheets.dart';
import '_shp_table_row.dart';
import '_shp_table_detail.dart';

class FirstMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('SmartView Tools - ${name}'),
          actions: <Widget>[
            Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  imageUrl,
                ),
                radius: 60,
                backgroundColor: Colors.transparent,
              ),
            ),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'DB',
              ),
              Tab(
                text: 'SHP',
              ),
              Tab(
                text: 'RCV',
              ),
              Tab(
                text: 'IS',
              ),
              Tab(
                text: 'QA',
              ),
              Tab(
                text: 'RVC',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Text('Dashboard'),
            ),
            Center(
              child: ShppingDetail(),
            ),
            Center(
              child: Text('Receiving'),
            ),
            Center(
              child: Text('IS'),
            ),
            Center(
              child: Text('QA'),
            ),
            Center(
              child: Text('Reverse'),
            )
          ],
        ),
        //body: ,
      ),
    );
  }
}
