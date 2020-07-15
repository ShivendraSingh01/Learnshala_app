import 'package:flutter/material.dart';

class Information_card extends StatelessWidget {
  final String head;
  final String body;
  final double Fontsize;

  Information_card({this.head, this.body, this.Fontsize});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Text('$head $body', style: TextStyle(fontSize: Fontsize)),
    );
  }
}
