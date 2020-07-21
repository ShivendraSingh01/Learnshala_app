import 'dart:ui';
import 'package:sharda_app/widgets/Info_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sharda_app/widgets/home_class_card.dart';
import 'package:sharda_app/widgets/getdisplaysize.dart';
import 'package:sharda_app/widgets/curve_screen.dart';

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Stack(
              children: <Widget>[
                curve_container(320.0),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 20.0, bottom: 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff00163E).withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    margin: EdgeInsets.only(
                        left: 50.0, top: 0.0, right: 50.0, bottom: 0.0),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Information_card(
                              head: 'Welcome',
                              body: '',
                              Fontsize: displayHeight(context) * 0.03),
                          Information_card(
                              head: 'Name:',
                              body: 'Shivam',
                              Fontsize: displayHeight(context) * 0.02),
                          Information_card(
                              head: 'Email:',
                              body: 'abc@gmail.com',
                              Fontsize: displayHeight(context) * 0.02),
                          Information_card(
                              head: 'System ID:',
                              body: '2017012516',
                              Fontsize: displayHeight(context) * 0.02),
                          Information_card(
                              head: 'School:',
                              body: 'SET',
                              Fontsize: displayHeight(context) * 0.02),
                          Information_card(
                              head: 'Department:',
                              body: 'CSE',
                              Fontsize: displayHeight(context) * 0.02),
                          Information_card(
                              head: 'Year:',
                              body: 'First',
                              Fontsize: displayHeight(context) * 0.02),
                          Information_card(
                              head: 'Class:',
                              body: 'C',
                              Fontsize: displayHeight(context) * 0.02),
                          Information_card(
                              head: 'Group:',
                              body: '2',
                              Fontsize: displayHeight(context) * 0.02),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Time Table',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xff00163E)),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                //Heading time Table
                Classes(
                  timing: '8:45-9:40',
                  subject: 'CSE112',
                  teacher: 'Teacher',
                  room: '201 B-1',
                ),
                Classes(
                  timing: '8:45-9:40',
                  subject: 'CSE112',
                  teacher: 'Teacher',
                  room: '201 B-1',
                ),
                Classes(
                  timing: '8:45-9:40',
                  subject: 'CSE112',
                  teacher: 'Teacher',
                  room: '201 B-1',
                ),
                Classes(
                  timing: '8:45-9:40',
                  subject: 'CSE112',
                  teacher: 'Teacher',
                  room: '201 B-1',
                ),
                Classes(
                  timing: '8:45-9:40',
                  subject: 'CSE112',
                  teacher: 'Teacher',
                  room: '201 B-1',
                ),
              ],
            ),
          ),
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
