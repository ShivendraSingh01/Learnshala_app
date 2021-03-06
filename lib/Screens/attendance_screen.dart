import 'dart:ui';
import 'package:sharda_app/Screens/view_attendance_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharda_app/widgets/getdisplaysize.dart';
import 'package:sharda_app/widgets/curve_screen.dart';
import 'view_attendance_screen.dart';

class attendancescreen extends StatefulWidget {
  @override
  _attendancescreenState createState() => _attendancescreenState();
}

class _attendancescreenState extends State<attendancescreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Stack(
              children: <Widget>[
                curve_container(250.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => view_all_attendance()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(35.0),
                    child: Container(
                      padding: EdgeInsets.all(displayHeight(context) * 0.01),
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
                      height: displayHeight(context) * 0.12,
                      width: double.maxFinite,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Icon(
                            Icons.data_usage,
                            size: displayHeight(context) * 0.05,
                            color: Colors.black,
                          ),
                          Text(
                            'View Attendance',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: displayHeight(context) * 0.024),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: displayHeight(context) * 0.05,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Today\'s Attendance',
                  style: TextStyle(
                      fontSize: displayHeight(context) * 0.04,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          //TODO : Add daily attendance here
        ],
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
