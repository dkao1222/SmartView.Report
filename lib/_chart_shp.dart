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
              body: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Team'),
                        Text('Total'),
                        Text('Wait - Pack'),
                        Text('Wait - Invoice'),
                        Text('Wait - PGI'),
                        Text('Failed - WaitPGI')
                      ],
                    ),
                    //flex: 6,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Super Down'),
                        Text(
                            '${values.where((element) => element.teamsName == 'Super Down').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == 'Super Down').where((element) => element.status == 'Wait - Pack').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == 'Super Down').where((element) => element.status == 'Wait - Invoice').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == 'Super Down').where((element) => element.status == 'Wait - PGI').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == 'Super Down').where((element) => element.status == 'Failed - WaitPGI').length}'),
                      ],
                    ),
                    //flex: 6,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('54 Downs'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 Downs').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 Downs').where((element) => element.status == 'Wait - Pack').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 Downs').where((element) => element.status == 'Wait - Invoice').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 Downs').where((element) => element.status == 'Wait - PGI').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 Downs').where((element) => element.status == 'Failed - WaitPGI').length}'),
                      ],
                    ),
                    //flex: 6,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('54 Non-Down'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 Non-Down').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 Non-Down').where((element) => element.status == 'Wait - Pack').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 Non-Down').where((element) => element.status == 'Wait - Invoice').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 Non-Down').where((element) => element.status == 'Wait - PGI').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 Non-Down').where((element) => element.status == 'Failed - WaitPGI').length}'),
                      ],
                    ),
                    //flex: 6,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('54 Non-Down SO'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 Non-Down SO').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 Non-Down SO').where((element) => element.status == 'Wait - Pack').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 Non-Down SO').where((element) => element.status == 'Wait - Invoice').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 Non-Down SO').where((element) => element.status == 'Wait - PGI').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 Non-Down SO').where((element) => element.status == 'Failed - WaitPGI').length}'),
                      ],
                    ),
                    //flex: 6,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('54 TPM'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 TPM').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 TPM').where((element) => element.status == 'Wait - Pack').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 TPM').where((element) => element.status == 'Wait - Invoice').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 TPM').where((element) => element.status == 'Wait - PGI').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 TPM').where((element) => element.status == 'Failed - WaitPGI').length}'),
                      ],
                    ),
                    //flex: 6,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('54 TPM-SO'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 TPM-SO').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 TPM-SO').where((element) => element.status == 'Wait - Pack').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 TPM-SO').where((element) => element.status == 'Wait - Invoice').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 TPM-SO').where((element) => element.status == 'Wait - PGI').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '54 TPM-SO').where((element) => element.status == 'Failed - WaitPGI').length}'),
                      ],
                    ),
                    //flex: 6,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('89 Downs'),
                        Text(
                            '${values.where((element) => element.teamsName == '89 Downs').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '89 Downs').where((element) => element.status == 'Wait - Pack').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '89 Downs').where((element) => element.status == 'Wait - Invoice').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '89 Downs').where((element) => element.status == 'Wait - PGI').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '89 Downs').where((element) => element.status == 'Failed - WaitPGI').length}'),
                      ],
                    ),
                    //flex: 6,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('89 TPM'),
                        Text(
                            '${values.where((element) => element.teamsName == '89 TPM').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '89 TPM').where((element) => element.status == 'Wait - Pack').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '89 TPM').where((element) => element.status == 'Wait - Invoice').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '89 TPM').where((element) => element.status == 'Wait - PGI').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '89 TPM').where((element) => element.status == 'Failed - WaitPGI').length}'),
                      ],
                    ),
                    //flex: 6,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('89 TPM-SO'),
                        Text(
                            '${values.where((element) => element.teamsName == '89 TPM-SO').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '89 TPM-SO').where((element) => element.status == 'Wait - Pack').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '89 TPM-SO').where((element) => element.status == 'Wait - Invoice').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '89 TPM-SO').where((element) => element.status == 'Wait - PGI').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == '89 TPM-SO').where((element) => element.status == 'Failed - WaitPGI').length}'),
                      ],
                    ),
                    //flex: 6,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('FSL - TXG'),
                        Text(
                            '${values.where((element) => element.teamsName == 'FSL - TXG').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == 'FSL - TXG').where((element) => element.status == 'Wait - Pack').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == 'FSL - TXG').where((element) => element.status == 'Wait - Invoice').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == 'FSL - TXG').where((element) => element.status == 'Wait - PGI').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == 'FSL - TXG').where((element) => element.status == 'Failed - WaitPGI').length}'),
                      ],
                    ),
                    //flex: 6,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('FSL - TNN'),
                        Text(
                            '${values.where((element) => element.teamsName == 'FSL - TNN').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == 'FSL - TNN').where((element) => element.status == 'Wait - Pack').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == 'FSL - TNN').where((element) => element.status == 'Wait - Invoice').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == 'FSL - TNN').where((element) => element.status == 'Wait - PGI').length}'),
                        Text(
                            '${values.where((element) => element.teamsName == 'FSL - TNN').where((element) => element.status == 'Failed - WaitPGI').length}'),
                      ],
                    ),
                    //flex: 6,
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
