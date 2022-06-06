// ignore_for_file: file_names
import 'package:flutter/material.dart';

import '../theme/Theme.dart';


// ignore: use_key_in_widget_constructors
class PrivacyPolicyPage extends StatelessWidget{
    @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title:Row(
        children: const [
          Text('Políticas de privacidad',
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
      body: ListView(
        padding: const EdgeInsets.all(15),
        children:
          [Column(
            children:  const [
              Text("Términos y condiciones", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,fontFamily: 'Antipasto'),),
              SizedBox(height: 10,),
              Text("Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones.", style: TextStyle(fontSize: 14), textAlign: TextAlign.justify,),
              SizedBox(height: 15,),
              Text("Usar los servicios y plataformas", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Antipasto'),),
              SizedBox(height: 10,),
              Text("Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones.", style: TextStyle(fontSize: 14), textAlign: TextAlign.justify,),
              SizedBox(height: 15,),
              Text("Usar los servicios y plataformas", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Antipasto'),),
            SizedBox(height: 10,),
            Text("Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones.", style: TextStyle(fontSize: 14), textAlign: TextAlign.justify,),
            SizedBox(height: 15,),
            Text("Usar los servicios y plataformas", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Antipasto'),),
            SizedBox(height: 10,),
            Text("Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones.", style: TextStyle(fontSize: 14), textAlign: TextAlign.justify,),
            SizedBox(height: 15,),
            Text("Usar los servicios y plataformas", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Antipasto'),),
            SizedBox(height: 10,),
            Text("Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones.", style: TextStyle(fontSize: 14), textAlign: TextAlign.justify,),
            SizedBox(height: 15,),
            Text("Usar los servicios y plataformas", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,fontFamily: 'Antipasto'),),
            SizedBox(height: 10,),
            Text("Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones. Para usar esa aplicación es necesario que aceptes los términos y condiciones.", style: TextStyle(fontSize: 14), textAlign: TextAlign.justify,),
            SizedBox(height: 15,),
            ],
          ),
        ],
      ),

    );
  }
}