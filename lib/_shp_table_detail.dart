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
          final childrens = <Widget>[];

          for (var i = 0; i < snapshot.data.length; i++) {
            /*
            var checkDateTime = snapshot.data[i].serviceEnd
                .difference(DateTime.now().add(Duration(hours: -8)));
                */
            var shipmentDate = DateTime.tryParse(
                    snapshot.data[i].shipmentDateTime.toString() ?? '');
                //.add(Duration(hours: -8));
            //snapshot.data[i].shipmentDateTime.toString().trim()
            var serviceStart = DateTime.tryParse(
                    snapshot.data[i].serviceStart.toString() ?? '');
                //.add(Duration(hours: -8));

            var serviceEnd =
                DateTime.tryParse(snapshot.data[i].serviceEnd.toString() ?? '');
                    //.add(Duration(hours: -8));

            var checkDateTime = serviceEnd.difference(DateTime.now());

            //rgba(236, 240, 241,1.0) white
            //rgba(149, 165, 166,1.0) gray
            //rgba(231, 76, 60,1.0) red
            //rgba(243, 156, 18,1.0) yellow
            //rgba(46, 204, 113,1.0) green
            print('${checkDateTime.inMinutes}');
            var cardcolord = new Color.fromRGBO(236, 240, 241, 1.0);
            if (checkDateTime.inMinutes < 0) {
              cardcolord = Color.fromRGBO(236, 240, 241, 1.0);
            } else if (checkDateTime.inMinutes > 0 &&
                checkDateTime.inMinutes <= 60) {
              cardcolord = Color.fromRGBO(231, 76, 60, 1.0);
            } else if (checkDateTime.inMinutes > 60 &&
                checkDateTime.inMinutes < 120) {
              cardcolord = Color.fromRGBO(243, 156, 18, 1.0);
            } else {
              cardcolord = Color.fromRGBO(46, 204, 113, 1.0);
            }

            //print(checkDateTime.difference(snapshot.data[i].serviceEnd));

            var iconset = new Icon(Icons.hourglass_full);
            if (snapshot.data[i].status == 'Failed - WaitPGI') {
              iconset = Icon(
                Icons.warning,
                color: Colors.red,
              );
            } else {
              iconset = Icon(
                Icons.local_shipping,
                color: Colors.green,
              );
            }

            childrens.add(
              new Card(
                color: cardcolord,
                child: ListTile(
                  leading: iconset,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        'DN:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          '${snapshot.data[i].delivery.toString().trim()}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'Items:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          '${snapshot.data[i].items.toString().trim()}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'Team:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          '${snapshot.data[i].teamsName.toString().trim()}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'Type:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          '${snapshot.data[i].teamsName.toString().trim()}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        'Status:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Text(
                          '${snapshot.data[i].status.toString().trim()}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'Shipment: ${snapshot.data[i].shipmentNo}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                                'shpt: ${snapshot.data[i].shpt.toString().trim()}'),
                          ),
                          Expanded(
                            child: Text(
                                'DP: ${snapshot.data[i].dp.toString().trim()}'),
                          ),
                          Expanded(
                            child: Text(
                                'Ship-To: ${snapshot.data[i].shipTo.toString().trim()}'),
                          ),
                          Expanded(
                            child: Text('${shipmentDate}'),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              'Start: ${serviceStart}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'KPI: ${snapshot.data[i].kpi}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'End: ${serviceEnd}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                    //),
                  ),
                  //],
                  dense: true,
                ),
              ),
            );
            /*
            childrens.add(new Container(
                //shrinkWrap: true,
                //scrollDirection: Axis.horizontal,
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(3.0),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blueAccent)),
                child: Row(
                  children: [
                    Expanded(
                      child: iconset,
                      flex: 1,
                    ),
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                    '${snapshot.data[i].teamsName.toString().trim()}'),
                              ),
                              Expanded(
                                child: Text(
                                    '${snapshot.data[i].teamsName.toString().trim()}'),
                              ),
                              Expanded(
                                child: Text(
                                    '${snapshot.data[i].teamOrde.toString().trim()}'),
                              ),
                              Expanded(
                                child: Text(
                                    'shpt: ${snapshot.data[i].shpt.toString().trim()}'),
                              ),
                              Expanded(
                                child: Text(
                                    'DP: ${snapshot.data[i].dp.toString().trim()}'),
                              ),
                              Expanded(
                                child: Text(
                                    'Status: ${snapshot.data[i].status.toString().trim()}'),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                    'DN: ${snapshot.data[i].delivery.toString().trim()}'),
                              ),
                              Expanded(
                                child: Text(
                                    'Items: ${snapshot.data[i].items.toString().trim()}'),
                              ),
                              Expanded(
                                child: Text(
                                    'Ship-To: ${snapshot.data[i].shipTo.toString().trim()}'),
                              ),
                              Expanded(
                                child: Text(
                                    '${snapshot.data[i].shipmentDateTime.toString().trim()}'),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Expanded(
                                child: Text(
                                    'Shipment: ${snapshot.data[i].shipmentNo}'),
                              ),
                              Expanded(
                                child: Text(
                                    'Start: ${snapshot.data[i].serviceStart}'),
                              ),
                              Expanded(
                                child: Text('KPI: ${snapshot.data[i].kpi}'),
                              ),
                              Expanded(
                                child:
                                    Text('End: ${snapshot.data[i].serviceEnd}'),
                              ),
                            ],
                          ),
                        ],
                      ),
                      flex: 8,
                    ),
                  ],
                )));
                */
          }

          return new ListView(
              //shrinkWrap: true,
              //scrollDirection: Axis.horizontal,
              children: childrens);

          /*
          final childrens = [];
          const _shpDetailDataColumn = const <DataColumn>[
            DataColumn(label: Text('Teams Name')),
            //DataColumn(label: Text('Teams Orde')),
            //DataColumn(label: Text('Shpt')),
            //DataColumn(label: Text('DP')),
            DataColumn(label: Text('Delivery')),
            DataColumn(label: Text('items')),

            //DataColumn(label: Text('ShipTo')),
            //DataColumn(label: Text('Shipment')),
            //DataColumn(label: Text('Create Date/Time')),
            //DataColumn(label: Text('Service Start')),
            DataColumn(label: Text('Service End')),
            DataColumn(label: Text('KPI')),
            DataColumn(label: Text('Status')),
          ];

          for (var i = 0; i < snapshot.data.length; i++) {
            childrens.add(
              [
                snapshot.data[i].teamsName.toString(),
                snapshot.data[i].teamOrde.toString(),
                snapshot.data[i].shpt.toString(),
                snapshot.data[i].dp.toString(),
                snapshot.data[i].delivery.toString(),
                snapshot.data[i].items.toString(),
                snapshot.data[i].shipTo.toString(),
                snapshot.data[i].shipmentNo.toString(),
                snapshot.data[i].shipmentDateTime.toString(),
                snapshot.data[i].serviceStart.toString(),
                snapshot.data[i].serviceEnd.toString(),
                snapshot.data[i].kpi.toString(),
                snapshot.data[i].status.toString(),
              ],
            );
          }

          return new PaginatedDataTable(
            columns: _shpDetailDataColumn,
            rowsPerPage: PaginatedDataTable.defaultRowsPerPage,
            source: DataTableSource(childrens) ,
          );
          */
          /*
          return new SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FittedBox(
                child: DataTable(
                  //rowsPerPage: 20,
                  sortColumnIndex: 4,
                  sortAscending: true,
                  columns: const <DataColumn>[
                    DataColumn(label: Text('Teams Name')),
                    //DataColumn(label: Text('Teams Orde')),
                    //DataColumn(label: Text('Shpt')),
                    //DataColumn(label: Text('DP')),
                    DataColumn(label: Text('Delivery')),
                    DataColumn(label: Text('items')),

                    //DataColumn(label: Text('ShipTo')),
                    //DataColumn(label: Text('Shipment')),
                    //DataColumn(label: Text('Create Date/Time')),
                    //DataColumn(label: Text('Service Start')),
                    DataColumn(label: Text('Service End')),
                    DataColumn(label: Text('KPI')),
                    DataColumn(label: Text('Status')),
                  ],
                  //source: childrens.),
                  rows: snapshot.data
                      .map(
                        (e) => DataRow(cells: [
                          DataCell(Text(e.teamsName)),
                          DataCell(Text(e.delivery)),
                          DataCell(Text(e.items.toString())),
                          DataCell(Text(e.serviceEnd.toString())),
                          DataCell(Text(e.kpi.toString())),
                          DataCell(Text(e.status)),
                        ]),
                      )
                      .toList(),
                ),
              ),
            ),
          );
          */
        }

        //return new
      },
    ));
  }
}
