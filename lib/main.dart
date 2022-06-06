import 'package:app_angela_maria/notifications/notificationservice.dart';
import 'package:app_angela_maria/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'pages/NotificationPage.dart';
import 'pages/Privacy&PolicyPage.dart';
import 'pages/Terms&ConditionsPage.dart';
import 'routes/routes.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService().initNotification();
  runApp(MaterialApp(debugShowCheckedModeBanner: false,initialRoute: '/loginPage',routes: {
        '/loginPage' : (context) => LoginPage(),
        '/routes'  :(context) =>  Routes(),
        '/TermsConditions'  :(context) =>  TermsConditionsPage(),
        '/PrivacyPolicy'  :(context) =>  PrivacyPolicyPage(),
        '/Notification'  :(context) =>  NotificationPage(),
      },));
}

// ignore: use_key_in_widget_constructors
class AngelaMaria extends StatefulWidget {

    @override
    _AngelaMariaState createState() => _AngelaMariaState();
}


class _AngelaMariaState extends State<AngelaMaria>{


  @override
  Widget build(BuildContext context) {


    return const Scaffold(
    
    );

  }
}
