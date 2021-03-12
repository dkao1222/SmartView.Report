import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_browser.dart';

class ShpTable {
  const ShpTable({
    this.teamsName,
    this.teamOrde,
    this.shpt,
    this.dp,
    this.delivery,
    this.country,
    this.items,
    this.orde,
    this.shipTo,
    this.shipmentNo,
    this.shipmentDateTime,
    this.serviceStart,
    this.serviceEnd,
    this.kpi,
    this.status,
    this.shpCondition,
  });

  final String teamsName;
  final String teamOrde;
  final String shpt;
  final String dp;
  final String delivery;
  final String country;
  final int items;
  final String orde;
  final String shipTo;
  final String shipmentNo;
  final DateTime shipmentDateTime;
  final DateTime serviceStart;
  final DateTime serviceEnd;
  final int kpi;
  final String status;
  final String shpCondition;

  @override
  String toString() =>
      'shpTable{teamsName: $teamsName, teamOrde: $teamOrde, shpt: $shpt, dp: $dp, delivery: $delivery, country: $country, items: $items, order: $orde, shipTo: $shipTo, shipmentNo: $shipmentNo, shipmentDateTime: $shipmentDateTime, serviceStart: $serviceStart, serviceEnd: $serviceEnd, kpi:$kpi, status: $status, shpCondition: $shpCondition }';

  factory ShpTable.fromGsheets(Map<dynamic, dynamic> json) {
    return ShpTable(
      teamsName: json['TeamsName'].toString().trim(),
      teamOrde: json['TeamOrde'].toString().trim(),
      shpt: json['Shpt'].toString().trim(),
      dp: json['DP'].toString().trim(),
      delivery: json['Delivery'].toString().trim(),
      country: json['Country'].toString().trim(),
      items: int.tryParse(json['Items'] ?? ''),
      orde: json['Orde'].toString().trim(),
      shipTo: json['ShipTo'].toString().trim(),
      shipmentNo: json['ShipmentNo'].toString().trim(),
      shipmentDateTime: DateTime.fromMillisecondsSinceEpoch(
          int.tryParse(json['ShipmentDateTime'] ?? '')),
      serviceStart: DateTime.fromMillisecondsSinceEpoch(
          int.tryParse(json['Service_Start'] ?? '')),
      serviceEnd: DateTime.fromMillisecondsSinceEpoch(
          int.tryParse(json['Service_End'] ?? '')),
      kpi: int.tryParse(json['KPI_Hour'] ?? ''),
      status: json['STATUS'].toString().trim(),
      shpCondition: json['SHPCondition'].toString().trim(),
    );
  }
}
