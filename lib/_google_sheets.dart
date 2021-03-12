import 'dart:convert';
import 'dart:html';

import 'package:gsheets/gsheets.dart';
import '_shp_table_row.dart';
import 'dart:convert';

// your google auth credentials
const _credentials = r'''
{
  "type": "service_account",
  "project_id": "fluent-cinema-305409",
  "private_key_id": "f5fc8723ceda54dfe92dc5a66adc84babcdd9efc",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC36J39cN+pPoFI\nqJLCB7mTglyFkweiDT9J1+nV2cbbqaFeEPJjxbW4vIi+O9u8YTjJzH3RjlzQgn35\ndNqWcfm1GRuL0DoJPAJ2B5DwG6UU0v97jsu+6t31agwSLYe0O0jU54k5f2gqgRW+\nTK2W9t/K/PSODHMO/0rNdNB1rahr9GOKhVFj55HhPWI3Mtode3p6eExWteiPCwqm\n4eb2+v4ON4pN3xFejcLW5n5D7okA1dafazvGWpmBDTVgoWQUU9bONrXg4w7cjlU5\nm3zKM+1BauOOAu9Q3L2/9G7khXfYc+Iq3XE7so4APYBOfhVgmdxTQW4yFlOZrTnx\npQMMvjHrAgMBAAECggEAQyoerQUQgfBUafM6qccFdMRKwvOn+XxqDS9f9FxU/jss\ntjxtMZfunnmoXQViYiGFill259Xcur+1fym4fPJCFmwFfeG9mErEwVNREQefmgPX\nD0peyapgBnVE1Eyxf1aZajvnB0srAT7kcHvzd6tQnwMT017jlGoS6QcM7LVPyaC4\nGZJnTEhrOHnMey/q55ZQRqMtucHUFHJRIuyBMDOfOyKDsa/KHWlViw0EyeM6qvOz\ns0dhwOh7jvsiVDYmrUbMs5RAMXK0XwZ6+0Ch96d8W9+B6tqBs8bFv/e1C1jyTqEx\nm6ZmVMtNp4rrkCl1ek8KhmJTnZ3x4SuphGuFwywr2QKBgQDkZj37Ig1wFQTncoPW\nk3Rlj4qmbTJgQI/2mj6J5Op2XIGFkBdNX1AaDKQdWVTHhitxjvFBSJaVM1Jni3FN\nrvg09plrufFb1Xh0+0zDQRhjebVN1m/eGYdctiHNFYXncAM4XODQKYNqd7AzQh3B\nQJeZIvHmxiPINpYppLDFlmOhuQKBgQDOIgLXkXLFxu0MKEChsCU2oa2fyLxbHnUd\nTzUoV9dNdpOK0S1tL/NJQuGT0wg3dpYmt+n1WqoqT87YQe1v/DZqi8PndZYmat/B\nPSwrX7WyjIO3tyGkdoZgYiORRw3WCCaPUsf6oXbjHSjOkabbCMxysfZLH9clpvXQ\nR5hSwtMSwwKBgHtF47YjzvTro1X4LMgnle8q5j6lOUdSEWGcJpzufM2daBrahnkw\nNF+a6wkcKfH2rIQCDpyZvQySQqu4S1MOWNDdODk4hth2AynAaNIJ1Ev8aKq2TnKl\nfLXBZ8T1FOyxPEuzdXNktJVGPEeuK7keT7RLdByGXNG3BJ09UluSq/uhAoGBAJu/\nmwIiReQmEAn1iBAjNZr3wmZOl/MJKlhA9ttKs8U16PkkX/x2FI6wWB0HgNfXZFBQ\n+heGr7hUoOdJuQu6N6t9e0Ix2IeijPpHLE6BfJoyDXwMhQDtBU9iF5m3ZD7p3ajB\nVZSL13Z3G9QovTgWh9PJn1zX7AnpAyaiUfeGeVFdAoGBAMXGidNyUx11E5f+x+oq\n4eEHyS9gVW70pAXYh9Gbs03SIDxpHh37NH/E0lZ4kIl+D3smrlAGN+qhtkyzARXk\nIZWg7zBUhbtRcRNt1RkGKTT09fmZzdfURvqqKc3C+O+JEAt1u48OMdyzgA0zn88l\nKnqAbzqtz4RmTvtpLvmRzaJV\n-----END PRIVATE KEY-----\n",
  "client_email": "smartview-sheets@fluent-cinema-305409.iam.gserviceaccount.com",
  "client_id": "110644575845278606954",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/smartview-sheets%40fluent-cinema-305409.iam.gserviceaccount.com"
}
''';

// your spreadsheet id
const _spreadsheetId = '1hUlpKRUr_VjYaMpoM4TeMkeSFAgU9HxwPtLsuKOkEkc';

final GSheets _gsheets = GSheets(_credentials);
Spreadsheet _spreadsheet;
Worksheet _productSheet;

Future<void> init() async {
  _spreadsheet ??= await _gsheets.spreadsheet(_spreadsheetId);
  _productSheet ??= await _spreadsheet.worksheetByTitle('Shipping');
}

Future<List<ShpTable>> getShpTableALL() async {
  await init();
  final products = await _productSheet.values.map.allRows(fromRow: 2);
  //print(products);

  return products.map((json) => ShpTable.fromGsheets(json)).toList();
}

void getGoogleSheet() async {
  //getShpTableALL();
}

class ProductManager {
  final GSheets _gsheets = GSheets(_credentials);
  Spreadsheet _spreadsheet;
  Worksheet _productSheet;
}
