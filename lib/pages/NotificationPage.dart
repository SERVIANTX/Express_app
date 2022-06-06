// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../theme/Theme.dart';

// ignore: use_key_in_widget_constructors
class NotificationPage extends StatefulWidget {

    @override
    _NotificationState createState() => _NotificationState();

}

class _NotificationState extends State<NotificationPage>{
  var count = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Row(
            children: const [
              Text('Notificaciones',
                  style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Antipasto'
                      ),
                      ),
            ]
          ),
          flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: Kcolorgradient,
              ),
            ),
        ),
      backgroundColor: kWhiteColor,
      body: Center(
      child: count == 1 ?  Container(
        alignment: Alignment.center,
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.notifications_off_sharp, color: Colors.grey, size: 75,),
          const SizedBox(height: 15),
          Container(
            alignment: Alignment.center,
            child:
              const Text('No hay notificaciones',
                style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'Antipasto',
                      color: Colors.grey,
                    ),
                    ),
          ),
        ],
        ),
      ),
      )
      : Container(
        alignment: Alignment.center,
        child: const Icon(Icons.notifications_off_sharp, color: Colors.black, size: 45,)
      )

      ),
    );
  }

}