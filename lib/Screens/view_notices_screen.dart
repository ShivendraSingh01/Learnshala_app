import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';

class view_all_notices extends StatelessWidget {
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
          title: const Text('All Notices'),
          centerTitle: true,
        ),
        body: notice(
          title: 'Title',
          description: 'Description',
          datetime: DateTime.now().toString(),
        ),
      ),
    );
  }
}

class notice extends StatelessWidget {
  final String title;
  final String description;
  final String datetime;

  const notice({this.title, this.description, this.datetime});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ExpansionTileCard(
        title: Text(
          this.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(this.datetime),
        children: <Widget>[
          Divider(
            thickness: 1.0,
            height: 1.0,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Text(
                this.description,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
