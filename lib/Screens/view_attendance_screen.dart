// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'dart:math';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:sharda_app/widgets/getdisplaysize.dart';
import 'package:sharda_app/widgets/classcard.dart';

class view_all_attendance extends StatefulWidget {
  @override
  _view_all_attendanceState createState() => _view_all_attendanceState();
}

class _view_all_attendanceState extends State<view_all_attendance>
    with SingleTickerProviderStateMixin {
  Map<String, double> dataMap = Map();

  List<Color> colorList = [
    Colors.red,
    Colors.green,
  ];

  double absent = 23;
  double present = 54;
  double percentage() => (present / (present + absent) * 100);

  AnimationController _controller;

  @override
  void initState() {
    dataMap.putIfAbsent("Absent", () => absent);
    dataMap.putIfAbsent("Present", () => present);
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: EdgeInsets.only(left: 12),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          backgroundColor: Color(0xff023e8a),
          title: const Text('Attendance'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Stack(
                children: <Widget>[
                  AnimatedBuilder(
                    animation: _controller.view,
                    builder: (context, child) {
                      return Transform.rotate(
                          angle: _controller.value * 2 * pi, child: child);
                    },
                    child: Center(
                      child: PieChart(
                        dataMap: dataMap,
                        animationDuration: Duration(milliseconds: 800),
                        chartLegendSpacing: 32.0,
                        chartRadius: MediaQuery.of(context).size.width / 4,
                        showChartValuesInPercentage: false,
                        showChartValues: false,
                        showChartValuesOutside: false,
                        chartValueBackgroundColor: Colors.grey[200],
                        colorList: colorList,
                        showLegends: false,
                        legendPosition: LegendPosition.right,
                        decimalPlaces: 1,
                        showChartValueLabel: false,
                        initialAngle: 0,
                        chartValueStyle: defaultChartValueStyle.copyWith(
                          color: Colors.blueGrey[900].withOpacity(0.9),
                        ),
                        chartType: ChartType.disc,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(displayHeight(context) * 0.017),
                      child: Container(
                        child: Center(
                          child: Text(
                            percentage().toStringAsFixed(2),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: displayHeight(context) * 0.03),
                          ),
                        ),
                        height: MediaQuery.of(context).size.width / 4.5,
                        width: MediaQuery.of(context).size.width / 4.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 8,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    class_card(class_code: 'CSE 111', class_name: 'Automata'),
                    class_card(
                        class_code: 'CSE 121', class_name: 'Data Structure'),
                    class_card(
                        class_code: 'CSE 112', class_name: 'Compiler Design'),
                    class_card(class_code: 'CSE 211', class_name: 'DAA'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
