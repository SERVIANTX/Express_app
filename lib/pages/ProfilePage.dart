// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../theme/Theme.dart';


final Uri _url = Uri.parse('https://www.youtube.com/');

// ignore: use_key_in_widget_constructors
class ProfilePage extends StatefulWidget {

    @override
    _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<ProfilePage>{

bool isSwitched = false;
  @override
  Widget build(BuildContext context) {

    var parametros = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var id = parametros['id'].toString();
    var url = "https://angelamaria3.000webhostapp.com/views/img/users/"+id+"/"+parametros['image'];
    return Scaffold(
      backgroundColor: kWhiteColor,

      body:ListView(

        children: [
          Container(
                height: 210,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: Kcolorgradient,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(127, 27, 94, 31),
                      offset: Offset(9, 9),
                      blurRadius: 6,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Center(
                  child: Container(
                    decoration:const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(80),
                          topLeft: Radius.circular(80),
                          bottomRight: Radius.circular(80),
                          bottomLeft: Radius.circular(80),
                        ),
                    boxShadow: [
                    BoxShadow(
                          color: Color.fromARGB(127, 27, 94, 31),
                          offset: Offset(0.0, 4.0),
                          blurRadius: 20.0,
                          spreadRadius: 6,
                        )
                      ]
                    ),

                    child: Container(
                          height: 170.0,
                          width: 170.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(85.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                  url
                                ),
                                fit: BoxFit.cover,
                              ),
                              ),
                        ),
                  ),
                ),

            ),

          const SizedBox(height: 20),
          // ignore: deprecated_member_use
          FlatButton (
            height: 65.0,
            child:Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 17),
                  child: Row(
                      children:<Widget>[

                        const Icon(Icons.notifications, color: Colors.black,size: 28,),
                          Column(
                            children: const [
                              Text('', style: TextStyle(fontSize: 3)),
                              Text('  ''Notificaciones', style: TextStyle(color: Colors.black, fontSize: 18,fontFamily: 'Antipasto'),),],
                          ),

                      ]
                      ),
                ),
                Expanded(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children:[
                      const Text('', style: TextStyle(fontSize: 6)),
                    Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                            });
                          },
                        ),
                        ],
                        ),
                      ),
                    ],
        ),
            onPressed: () async {

              Navigator.of(context).pushNamed('/Notification');
            },
          ),

          // ignore: deprecated_member_use
          FlatButton (
            height: 65.0,
            child:Row(

            mainAxisAlignment: MainAxisAlignment.start,
            children:const <Widget>[
            Icon(Icons.edit, ),
            Text('   ''Editar perfil', style: TextStyle(color: Colors.black, fontSize: 18,fontFamily: 'Antipasto'), textAlign: TextAlign.left, ),
          ],
          ),
            onPressed: () async {
              //  SharedPreferences prefs = await SharedPreferences.getInstance();
              //     prefs.clear();
              // Navigator.of(context).pushReplacementNamed('/loginPage');
            },
          ),
          // ignore: deprecated_member_use
          FlatButton (
            height: 65.0,
            child:Row(

            mainAxisAlignment: MainAxisAlignment.start,
            children:const <Widget>[
            Icon(Icons.list, ),
            Text('   ''Términos y condiciones', style: TextStyle(color: Colors.black, fontSize: 18,fontFamily: 'Antipasto'), textAlign: TextAlign.left, ),
          ],
          ),
            onPressed: () async {

              Navigator.of(context).pushNamed('/TermsConditions');
            },
          ),
          // ignore: deprecated_member_use
          FlatButton (
            height: 65.0,
            child:Row(

            mainAxisAlignment: MainAxisAlignment.start,
            children:const <Widget>[
            Icon(Icons.shield_outlined,),
            Text('   ''Políticas de privacidad', style: TextStyle(color: Colors.black, fontSize: 18,fontFamily: 'Antipasto'), textAlign: TextAlign.left, ),
          ],
          ),
            onPressed: () async {
              
              Navigator.of(context).pushNamed('/PrivacyPolicy');
            },
          ),
          // ignore: deprecated_member_use
          FlatButton (
            height: 65.0,
            child:Row(

            mainAxisAlignment: MainAxisAlignment.start,
            children:const <Widget>[
            Icon(Icons.help, ),
            Text('   ''Ayuda', style: TextStyle(color: Colors.black, fontSize: 18,fontFamily: 'Antipasto'), textAlign: TextAlign.left, ),
          ],
          ),
            onPressed: () async {
              _launchUrl();
            },
          ),
          // ignore: deprecated_member_use
          FlatButton (
            height: 65.0,
            child:Row(

            mainAxisAlignment: MainAxisAlignment.start,
            children:const <Widget>[
            Icon(Icons.logout, ),
            Text('   ''Cerrar Sesión', style: TextStyle(color: Colors.black, fontSize: 18,fontFamily: 'Antipasto'), textAlign: TextAlign.left, ),
          ],
          ),
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              Navigator.of(context).pushReplacementNamed('/loginPage');
            },
          ),
          const SizedBox(height: 20),

        ],
      ),

    );
  }

}
void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'No se pudo inciar $_url';
}