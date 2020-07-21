import 'package:flutter/material.dart';
import 'package:sharda_app/widgets/classcard.dart';

class view_all_marksheet extends StatefulWidget {
  @override
  _view_all_marksheetState createState() => _view_all_marksheetState();
}

class _view_all_marksheetState extends State<view_all_marksheet> {
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
          title: const Text('Marksheet'),
          centerTitle: true,
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            class_card(class_code: 'CSE 111', class_name: 'Automata'),
            class_card(class_code: 'CSE 121', class_name: 'Data Structure'),
            class_card(class_code: 'CSE 112', class_name: 'Compiler Design'),
            class_card(class_code: 'CSE 211', class_name: 'DAA'),
          ],
        ),
      ),
    );
  }
}
