import 'package:flutter/material.dart';
//import 'login_page.dart';
//import 'sign_in.dart';

class DashBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width / 10,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('Pre Chart Div 1'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width / 10,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('Pre Chart Div 2'),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width / 10,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('Pre Chart Div 1'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
