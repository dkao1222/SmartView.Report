// Copyright (c) 2019 Souvik Biswas

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'package:flutter/material.dart';
import 'login_page.dart';
import 'sign_in.dart';
//import 'dash_board.dart';
//import '_google_sheets.dart';
//import '_shp_table_row.dart';
import '_shp_table_detail.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width / 10,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.blue[100], Colors.blue[400]],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          imageUrl,
                        ),
                        radius: 60,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'NAME',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        name,
                        style: TextStyle(
                            //fontSize: 12,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'EMAIL',
                      style: TextStyle(
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        email,
                        style: TextStyle(
                            //fontSize: 12,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 20),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: RaisedButton(
                        onPressed: () {
                          signOutGoogle();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }), ModalRoute.withName('/'));
                        },
                        color: Colors.deepPurple,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Sign Out',
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Container(
              color: Colors.greenAccent,
              width: MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width / 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.grey[100], Colors.grey[400]],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) {
                              return ShppingDetail();
                            },
                          ),
                          ModalRoute.withName('/'),
                        );
                      },
                      color: Colors.deepPurple[50],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Dashboard',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.deepPurple[50],
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Report Work',
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ),
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ],
                ),
              ),
            ),
            flex: 5,
          ),
        ],
      ),
    );
  }
}
