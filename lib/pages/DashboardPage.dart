// ignore_for_file: use_key_in_widget_constructors, file_names

import 'package:flutter/material.dart';

import '../Theme/Theme.dart';

class DashboardPage extends StatefulWidget {

    @override
    _DashboardPageState createState() => _DashboardPageState();

}

class _DashboardPageState extends State<DashboardPage>{



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body:
      Column(children: [
        Text('HOla'),
      ],)

    );
  }

}
