import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_firebase_sampple/_shp_table_row.dart';
import '_google_sheets.dart';
//import 'dart:convert';

//final detailValue = getShpTableALL();

class ShppingDetail extends StatelessWidget {
  List datas;
  @override
  Widget build(BuildContext context) {
    //getShpTableALL();
    return Scaffold(
        body: FutureBuilder<List<ShpTable>>(
      future: getShpTableALL(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return ListView();
        }
        if (snapshot.hasData) {
          final childrens = <Widget>[];

          for (var i = 0; i < snapshot.data.length; i++) {
            childrens.add(
              new ListView(
                children: [
                  ListTile(
                    title: Text('Teams Name:${snapshot.data[i].teamsName}'),
                  ),
                  ListTile(
                    title: Text('Teams Orde:${snapshot.data[i].teamOrde}'),
                  ),
                  ListTile(
                    title: Text('Shpt:${snapshot.data[i].shpt}'),
                  ),
                  ListTile(
                    title: Text('DP :${snapshot.data[i].dp}'),
                  ),
                  ListTile(
                    title: Text('Delivery:${snapshot.data[i].delivery}'),
                  ),
                  ListTile(
                    title: Text('items:${snapshot.data[i].items}'),
                  ),
                  ListTile(
                    title: Text('Ship-to:${snapshot.data[i].shipTo}'),
                  ),
                  ListTile(
                    title: Text('ShipmentNo:${snapshot.data[i].shipmentNo}'),
                  ),
                  ListTile(
                    title: Text(
                        'Shipment Date/Time:${snapshot.data[i].shipmentDateTime}'),
                  ),
                  ListTile(
                    title:
                        Text('Service Start:${snapshot.data[i].serviceStart}'),
                  ),
                  ListTile(
                    title: Text('Service End:${snapshot.data[i].serviceEnd}'),
                  ),
                  ListTile(
                    title: Text('KPI:${snapshot.data[i].kpi}'),
                  ),
                  ListTile(
                    title: Text('Status:${snapshot.data[i].status}'),
                  ),
                ],
              ),
            );
          }

          return new PageView(children: childrens);
        }

        //return new
      },
    ));
  }
}
