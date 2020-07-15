import 'dart:ui';
import 'package:sharda_app/widgets/curve_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharda_app/widgets/getdisplaysize.dart';

class marksheetscreen extends StatefulWidget {
  @override
  _marksheetscreenState createState() => _marksheetscreenState();
}

class _marksheetscreenState extends State<marksheetscreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                curve_container(250.0),
                Padding(
                  padding: const EdgeInsets.all(35.0),
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff00163E).withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    height: displayHeight(context) * 0.1,
                    width: double.maxFinite,
                    child: ListTile(
                      leading: Icon(
                        Icons.assignment,
                        size: displayHeight(context) * 0.05,
                        color: Colors.black,
                      ),
                      title: Text(
                        'View Marksheet',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: displayHeight(context) * 0.024),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: displayHeight(context) * 0.05,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: displayHeight(context) * 0.45,
                  left: displayWidth(context) * 0.25,
                  child: Text(
                    'Today\'s Marksheet',
                    style: TextStyle(
                        fontSize: displayHeight(context) * 0.03,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          //TODO : Add daily marksheet here
        ],
      ),
    );
  }
}
