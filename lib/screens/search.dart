import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  static const routeName = '/search';
  String? city;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(),
    body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IconButton(
              onPressed: () {

              },
              icon: Icon(Icons.location_searching)
          ),
          TextField(
            maxLines: 1,
            style: TextStyle(
              backgroundColor: Colors.white,
              color: Colors.grey
            ),
            onChanged: (text) {
              city = text;
            },
          )
        ],
      ),
    ),
  );
}