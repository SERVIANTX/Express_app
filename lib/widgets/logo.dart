import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class LogoHeader extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Positioned(
      top: 80,
      left: MediaQuery.of(context).size.width * 0.38,
      child: Container(

        height: 110,
        width: 110,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(blurRadius: 10, color: Colors.black26)
          ]
        ),
        child: Align(
          alignment: Alignment.center,
          child: Image.asset('lib/assets/img/LOGO2.png',),
          // child: Text('AM', style: TextStyle(fontSize: 21),),
        ),
      ),
    );
  }
}