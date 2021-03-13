import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import '_shp_table_row.dart';
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
          final childrens = <DataRow>[];

          for (var i = 0; i < snapshot.data.length; i++) {
            childrens.add(
              new DataRow(
                cells: <DataCell>[
                  DataCell(Text('Teams Name:${snapshot.data[i].teamsName}')),
                  DataCell(Text('Teams Name:${snapshot.data[i].teamOrde}')),
                  DataCell(Text('Teams Name:${snapshot.data[i].shpt}')),
                  DataCell(Text('Teams Name:${snapshot.data[i].dp}')),
                  DataCell(Text('Teams Name:${snapshot.data[i].delivery}')),
                  DataCell(Text('Teams Name:${snapshot.data[i].items}')),
                  DataCell(Text('Teams Name:${snapshot.data[i].shipTo}')),
                  DataCell(Text('Teams Name:${snapshot.data[i].shipmentNo}')),
                  DataCell(
                      Text('Teams Name:${snapshot.data[i].shipmentDateTime}')),
                  DataCell(Text('Teams Name:${snapshot.data[i].serviceStart}')),
                  DataCell(Text('Teams Name:${snapshot.data[i].serviceEnd}')),
                  DataCell(Text('Teams Name:${snapshot.data[i].kpi}')),
                  DataCell(Text('Teams Name:${snapshot.data[i].status}')),
                ],
              ),
            );
          }

          /*
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
          */
          return new DataTable(
              sortColumnIndex: 10,
              sortAscending: true,
              columns: [
                DataColumn(label: Text('Teams Name')),
                DataColumn(label: Text('Teams Orde')),
                DataColumn(label: Text('Shpt')),
                DataColumn(label: Text('DP')),
                DataColumn(label: Text('Delivery')),
                DataColumn(label: Text('items')),
                DataColumn(label: Text('ShipTo')),
                DataColumn(label: Text('Shipment')),
                DataColumn(label: Text('Create Date/Time')),
                DataColumn(label: Text('Service Start')),
                DataColumn(label: Text('Service End')),
                DataColumn(label: Text('KPI')),
                DataColumn(label: Text('Status')),
              ],
              rows: childrens);
        }

        //return new
      },
    ));
  }
}
