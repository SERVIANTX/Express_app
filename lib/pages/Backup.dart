// import 'package:awesome_dialog/awesome_dialog.dart';
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../app/data/helpers/http.dart';
import '../app/data/helpers/http_method.dart';
import '../widgets/Footer.dart';
import '../widgets/Header.dart';
import '../widgets/logo.dart';
import 'package:shared_preferences/shared_preferences.dart';




// ignore: use_key_in_widget_constructors, must_be_immutable
class LoginPage extends StatefulWidget {

    @override
    _LoginPageState createState() => _LoginPageState();


}

class _LoginPageState extends State<LoginPage>{

    bool isChecked = false;
    final email = TextEditingController();
    final password = TextEditingController();
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    bool _obscureText = true;

    String em = '';
    String pass = '';

  @override
  Widget build(BuildContext context) {
      Color getColor(Set<MaterialState> states) {
        return Colors.green;
      }

    return Scaffold(

      key: _scaffoldKey,
      body: GestureDetector(
        onTap: (){
          final FocusScopeNode focus = FocusScope.of(context);
            if(!focus.hasPrimaryFocus && focus.hasFocus){
              FocusManager.instance.primaryFocus?.unfocus();
            }
        },
        child: ListView(

          padding: const EdgeInsets.only(top: 0),
          physics: const BouncingScrollPhysics(),
          
          children: [

            Stack(
              children: [
                HeaderLogin(),
                LogoHeader()
              ],
            ),
            _Titulo(),

            const SizedBox(height: 40),

            Container(
              padding:const EdgeInsets.symmetric(horizontal: 20.0),

                    child: Column(
                      children: [

                        TextField(

                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                          hintText: 'Correo',
                          filled: true,
                          fillColor:  const Color(0xffEBDCFA),
                          prefixIcon: const Icon(Icons.mail_outline, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffEBDCFA)),
                            borderRadius: BorderRadius.circular(50)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffEBDCFA)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),),
                        const SizedBox(height: 20),
                        TextField(
                          controller: password,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                          suffixIcon: GestureDetector(onTap: (){
                              setState(() {
                                _obscureText=!_obscureText;
                              });
                          },
                            child: Icon(_obscureText
                            ? Icons.visibility
                            : Icons.visibility_off
                            ),
                          ),
                          hintText: 'Contraseña',
                          filled: true,
                          fillColor: const Color(0xffEBDCFA),
                          prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffEBDCFA)),
                            borderRadius: BorderRadius.circular(50)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xffEBDCFA)),
                            borderRadius: BorderRadius.circular(50),
                          ),
                        )

                        ),
                        const SizedBox(height: 5),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(getColor),
                                  value: isChecked,
                                  onChanged: (value){
                                    isChecked = !isChecked;
                                    setState(() {
                                    });
                                  },
                                ),
                                const Expanded(child: Text("Recuérdame", style: TextStyle(fontSize: 16,color: Colors.black))),

                            ],
                        ),
                      ],
                    ),
            ),

            const SizedBox(height: 40),

            Container(
              margin: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 42, 146, 39),
                      borderRadius: BorderRadius.circular(50)
                    ),
                    // ignore: deprecated_member_use
                    child: FlatButton (
                      child: const Text('INICIAR SESION', style: TextStyle(color: Colors.white, fontSize: 18),),
                      onPressed: () async {

                        em = email.text;
                        pass = password.text;

                        if(em == '' || pass == ''){

                          const snackBar = SnackBar(
                            content: Text('Correo o Contraseña se encuentra vacio!',style: TextStyle(fontSize: 16.0), textAlign: TextAlign.center,),
                            backgroundColor: Color.fromARGB(255, 42, 146, 39),
                            duration: Duration(seconds: 2),
                            padding: EdgeInsets.all(16.0),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(snackBar);

                        }else {

                            final http = Http(baseUrl: 'https://angelamaria.alwaysdata.net');

                            final result = await http.request('/users?login=true&suffix=user',
                            method: HttpMethod.post,
                            headers: {
                              "Authorization": "YJEntU7gJwbnqeukvXxnRgNzA3jg9Q",
                            },
                            body: {
                              "email_user": em,
                              "password_user": pass,
                            },

                            );

                              var datos = result.data['results'];
                              var datos2 = datos[0];
                              String id = datos2['id_user'].toString();


                            if(result.statusCode == 200){
                              if(isChecked == true){
                                guardar_datos(em, pass);
                              }

                            Navigator.of(context).pushReplacementNamed('/routes', arguments: {'nombre':datos2['displayname_user'], 'usuario':datos2['email_user'], 'id': id,'image':datos2['picture_user']}
                            );
                              FocusScope.of(context).unfocus();
                            }else{

                            const snackBar = SnackBar(
                            content: Text('Correo o Contraseña Erroneos!',style: TextStyle(fontSize: 16.0), textAlign: TextAlign.center,),
                            backgroundColor: Color.fromARGB(255, 42, 146, 39),
                            duration: Duration(seconds: 2),
                            padding: EdgeInsets.all(16.0),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }

                            email.text = '';
                            password.text = '';
                        }
                      },

                    ),
            ),

            const FootterLogin(),
          ],
        ),
      )
    );

  }



  // ignore: non_constant_identifier_names
  Future<void> guardar_datos(em, pass) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('correo', em);
    await prefs.setString('password', pass);

  }


  // ignore: non_constant_identifier_names
  Future<void>mostrar_datos() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();

    // ignore: await_only_futures
    var key = 'correo';
    // ignore: await_only_futures
    var correo = await prefs.getString(key);
    // ignore: await_only_futures
    var password = await prefs.getString('password');

    if(correo != null ){
      if(password != null){

        final http = Http(baseUrl: 'https://angelamaria.alwaysdata.net');

        final result = await http.request('/users?login=true&suffix=user',
        method: HttpMethod.post,
        headers: {
          "Authorization": "YJEntU7gJwbnqeukvXxnRgNzA3jg9Q",
        },
        body: {
          "email_user": correo,
          "password_user": password,
        },

        );
        var datos = result.data['results'];
        var datos2 = datos[0];

      if(result.statusCode == 200){


        Navigator.of(context).pushReplacementNamed('/routes', arguments: {'nombre':datos2['displayname_user'], 'usuario':datos2['email_user'], 'id':datos2['id_user'],'image':datos2['picture_user']}
      );
      }else{
        Navigator.of(context).pushReplacementNamed('/loginPage');
      }

      }
    }

    prefs.clear();
    // print(correo);
    // print(password);
  }



  @override
  void initState() {

    super.initState();

    mostrar_datos();
  }

}


class _Titulo extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: const [

          Text('Inicio De Sesión', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
        ],
      ),
      );
  }
}
