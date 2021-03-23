import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';
import '_google_sheets.dart';
import '_shp_table_row.dart';
import '_google_sheets.dart';

class ChartMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('test');
    return Center(
      child: ChartFamliy(),
    );
  }
}

class ChartFamliy extends StatefulWidget {
  @override
  _ChartFamliy createState() => new _ChartFamliy();
}

class _ChartFamliy extends State<ChartFamliy> {
  //'5011887771'
  final shpTable = new Scaffold();

  getShpAll() async {
    final datas = [];

    final value54Downs = await getShpTableALL().then((value) => {
          value
              .map((e) => e.teamsName)
              .where((element) => element == '54 Downs')
              .length
        }.toList());

    //datas.add(value54Downs[0]);
    datas.add(value54Downs[0]);
    //return
    return datas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ShpTable>>(
        future: getShpTableALL(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return ListView();
          }
          if (snapshot.hasData) {
            //final childrens = <Widget>[]
            //getShpAll();

            final values = snapshot.data.map((e) => e).toList();

            return Scaffold(
              body: DataTable(
                columns: <DataColumn>[
                  DataColumn(label: Text('Team')),
                  DataColumn(label: Text('Total')),
                  DataColumn(label: Text('Wait - Pack')),
                  DataColumn(label: Text('Wait - Invoice')),
                  DataColumn(label: Text('Wait - PGI')),
                  DataColumn(
                      label: Text(
                    'Failed - WaitPGI',
                  ))
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Super Down')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == 'Super Down').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == 'Super Down').where((element) => element.status == 'Wait - Pack').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == 'Super Down').where((element) => element.status == 'Wait - Invoice').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == 'Super Down').where((element) => element.status == 'Wait - PGI').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == 'Super Down').where((element) => element.status == 'Failed - WaitPGI').length}'))
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('54 Downs')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 Downs').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 Downs').where((element) => element.status == 'Wait - Pack').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 Downs').where((element) => element.status == 'Wait - Invoice').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 Downs').where((element) => element.status == 'Wait - PGI').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 Downs').where((element) => element.status == 'Failed - WaitPGI').length}'))
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('54 Non-Down')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 Non-Down').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 Non-Down').where((element) => element.status == 'Wait - Pack').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 Non-Down').where((element) => element.status == 'Wait - Invoice').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 Non-Down').where((element) => element.status == 'Wait - PGI').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 Non-Down').where((element) => element.status == 'Failed - WaitPGI').length}'))
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('54 Non-Down SO')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 Non-Down SO').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 Non-Down SO').where((element) => element.status == 'Wait - Pack').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 Non-Down SO').where((element) => element.status == 'Wait - Invoice').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 Non-Down SO').where((element) => element.status == 'Wait - PGI').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 Non-Down SO').where((element) => element.status == 'Failed - WaitPGI').length}'))
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('54 TPM')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 TPM').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 TPM').where((element) => element.status == 'Wait - Pack').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 TPM').where((element) => element.status == 'Wait - Invoice').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 TPM').where((element) => element.status == 'Wait - PGI').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 TPM').where((element) => element.status == 'Failed - WaitPGI').length}'))
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('54 TPM')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 TPM').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 TPM').where((element) => element.status == 'Wait - Pack').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 TPM').where((element) => element.status == 'Wait - Invoice').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 TPM').where((element) => element.status == 'Wait - PGI').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '54 TPM').where((element) => element.status == 'Failed - WaitPGI').length}'))
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('89 Downs')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '89 Downs').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '89 Downs').where((element) => element.status == 'Wait - Pack').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '89 Downs').where((element) => element.status == 'Wait - Invoice').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '89 Downs').where((element) => element.status == 'Wait - PGI').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '89 Downs').where((element) => element.status == 'Failed - WaitPGI').length}'))
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('89 TPM')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '89 TPM').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '89 TPM').where((element) => element.status == 'Wait - Pack').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '89 TPM').where((element) => element.status == 'Wait - Invoice').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '89 TPM').where((element) => element.status == 'Wait - PGI').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '89 TPM').where((element) => element.status == 'Failed - WaitPGI').length}'))
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('89 TPM-SO')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '89 TPM-SO').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '89 TPM-SO').where((element) => element.status == 'Wait - Pack').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '89 TPM-SO').where((element) => element.status == 'Wait - Invoice').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '89 TPM-SO').where((element) => element.status == 'Wait - PGI').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == '89 TPM-SO').where((element) => element.status == 'Failed - WaitPGI').length}'))
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('FSL - TXG')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == 'FSL - TXG').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == 'FSL - TXG').where((element) => element.status == 'Wait - Pack').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == 'FSL - TXG').where((element) => element.status == 'Wait - Invoice').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == 'FSL - TXG').where((element) => element.status == 'Wait - PGI').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == 'FSL - TXG').where((element) => element.status == 'Failed - WaitPGI').length}'))
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('FSL - TNN')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == 'FSL - TNN').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == 'FSL - TNN').where((element) => element.status == 'Wait - Pack').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == 'FSL - TNN').where((element) => element.status == 'Wait - Invoice').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == 'FSL - TNN').where((element) => element.status == 'Wait - PGI').length}')),
                      DataCell(Text(
                          '${values.where((element) => element.teamsName == 'FSL - TNN').where((element) => element.status == 'Failed - WaitPGI').length}'))
                    ],
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
