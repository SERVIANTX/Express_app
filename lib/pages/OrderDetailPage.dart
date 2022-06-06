// ignore_for_file: file_names

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:emojis/emojis.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:phone_caller/phone_caller.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../notifications/notificationservice.dart';
import '../utils/string_extension.dart';
import '../app/data/data_remote/data_ordersdetail.dart';
import '../app/data/helpers/http.dart';
import '../app/data/helpers/http_method.dart';
import '../theme/Theme.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class OrderDetailPage extends StatefulWidget {

    String id;
    String address;
    String phone;
    String date;
    String namepickup;

    // ignore: use_key_in_widget_constructors
    OrderDetailPage(this.id,this.address,this.phone,this.date,this.namepickup);

    @override
    _OrderDetailState createState() => _OrderDetailState();

}

// ignore: use_key_in_widget_constructors
class _OrderDetailState extends State<OrderDetailPage>{

  bool loading = true;

  List<Data_OrdersDetail> data = <Data_OrdersDetail>[];

  // ignore: body_might_complete_normally_nullable
  Future<List<Data_OrdersDetail>?> cargardatos() async{
    final http = Http(baseUrl: 'https://angelamaria.alwaysdata.net');
        final result = await http.request('/relations?rel=ordersdetails,products&type=orderdetail,product&select=*&linkTo=id_order&equalTo='+widget.id,
        method: HttpMethod.get,
        headers: {
          "Authorization": "YJEntU7gJwbnqeukvXxnRgNzA3jg9Q",
        },
        );
        var datos = result.data['results'];
        var count = result.data['total'];
      var registros = <Data_OrdersDetail>[];
      for(var i = 0; i < count; i++){
        var datos2 = datos[i];
        registros.add(Data_OrdersDetail.fromJson(datos2));
      }
      return registros;
  }
  @override
  void initState() {
    super.initState();
    cargardatos().then((value){
      setState(() {
        data.addAll(value!);
        loading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    DateTime date =DateTime.parse(widget.date);
    var outputFormat = DateFormat('hh:mm a | MM/dd/yyyy');
    var outputDate = outputFormat.format(date);
    return Scaffold(
      appBar: AppBar(
          title:Row(
            children: [
              Text('Detalles del pedido N° ' + widget.id,
                  style: const TextStyle(
                        fontSize: 20
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
      backgroundColor:  kWhiteColor,
      body: Column(
        children: [
          Column(
                children: const [
                  SizedBox(height: 15),
                  Text('Datos:',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Antipasto')),
                ],
              ),
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(15),
            elevation: 10,
            child: Column(
            children: <Widget>[
              ListTile(
                contentPadding: const EdgeInsets.fromLTRB(15, 10, 25, 0),
                title: Text(outputDate, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                subtitle:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const Text('',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700)),
                        RichText(text: TextSpan(
                          children:<TextSpan>[ const TextSpan(text: 'Cliente: ' ,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Antipasto')),
                          TextSpan(text: widget.namepickup ,style: const TextStyle(fontSize: 17,color: Colors.black),
                          ),
                          ],
                        )),
                        const Text('',style: TextStyle(fontSize: 2,fontWeight: FontWeight.w700)),
                        RichText(text: TextSpan(
                          children:<TextSpan>[ const TextSpan(text: 'Celular: ' ,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Antipasto')),
                          TextSpan(text: widget.phone ,style: const TextStyle(fontSize: 17, color: Colors.cyan),
                          recognizer: TapGestureRecognizer()..onTap = () async{
                            await PhoneCaller.callNumber(widget.phone);
                          }
                          ),
                          ],
                        )),
                        const Text('',style: TextStyle(fontSize: 2,fontWeight: FontWeight.w700)),
                        RichText(text: TextSpan(
                          children:<TextSpan>[ const TextSpan(text: 'Dirección: ' ,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Antipasto')),
                          TextSpan(text: widget.address ,style: const TextStyle(fontSize: 17,color: Colors.black)),
                          ],
                        )),
                        const Text('',style: TextStyle(fontSize: 17)),
                        ] ,
                        ),
              ),
            ],
          ),
          ),
          Column(
              children: const [
                SizedBox(height: 15),
                Text('Productos:',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Antipasto')),
              ],
            ),
          Expanded(
            child: loading==true ? const Center(child: SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(
                strokeWidth : 7,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
              )
            :ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  padding: const EdgeInsets.all(0),
                  child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(5),
                  elevation: 10,
                  child: Column(
                  children: <Widget>[
                    ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                          RichText(text: TextSpan(
                          children:<TextSpan>[ const TextSpan(text: 'Producto: ' ,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Antipasto')),
                            TextSpan(text: data[index].name_product.toCapitalized(), style: const TextStyle(fontSize: 17,color: Colors.black)),
                            ],
                          )),
                          ],),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        RichText(text: TextSpan(
                          children:<TextSpan>[ const TextSpan(text: 'Cantidad: ' ,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Antipasto')),
                            TextSpan(text: data[index].quantity_orderdetail.toString() , style: const TextStyle(fontSize: 17,color: Colors.black)),
                            ],
                          )),
                      ] ,),
                      leading: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('',style: TextStyle(fontSize: 5)),
                          Image.network("https://angelamaria3.000webhostapp.com/views/img/products/" + data[index].image_product,height: 45,width: 45,),
                          ],)
                    )
                  ],
                ),
                ),
                );
              },
            ),
            ),
            // ignore: deprecated_member_use
            FlatButton(color:Colors.green,
                minWidth: 300.0,
                height: 45.0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80)),
                child: const Text(' Aceptar ', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white)),
                onPressed:() async{
                  AwesomeDialog(
                      context: context,
                      dialogType: DialogType.QUESTION,
                      headerAnimationLoop: false,
                      animType: AnimType.BOTTOMSLIDE,
                      title: 'Aceptar el pedido',
                      desc: '¿Deseas aceptar el pedido?',
                      buttonsTextStyle: const TextStyle(color: Colors.black),
                      showCloseIcon: true,
                      btnCancelOnPress: () {},
                      btnOkOnPress: () async{
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            // ignore: await_only_futures
                            var token = await prefs.getString('token');
                            // ignore: await_only_futures
                            var id = await prefs.getString('id');

                            final http = Http(baseUrl: 'https://angelamaria.alwaysdata.net');

                            final result = await http.request('/orders?id='+ widget.id +'&nameId=id_order&token='+token! +'&table=users&suffix=user',
                            method: HttpMethod.put,
                            headers: {
                              "Authorization": "YJEntU7gJwbnqeukvXxnRgNzA3jg9Q",
                              "Content-Type": "application/x-www-form-urlencoded",
                            },
                            body: {
                              "status_order": '1',
                              "id_userrepartidor_order": id,
                            },
                            );
                            if(result.statusCode == 200){
                                Navigator.of(context).pop();
                                  final snackBar = SnackBar(
                                    margin: const EdgeInsets.all(17),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                    behavior: SnackBarBehavior.floating,
                                    content: const Text('Pedido Exitoso',style: TextStyle(fontSize: 16.0,fontFamily: 'Antipasto'), textAlign: TextAlign.center,),
                                    backgroundColor: const Color.fromARGB(255, 42, 146, 39),
                                    duration: const Duration(seconds: 2),
                                    padding: const EdgeInsets.all(16.0),
                                  );
                                NotificationService().stylishNotification(
                                1,
                                '🛍️ Pedido N° '+ widget.id + ' '+'Aceptado!',
                                '¡Aceptado exitosamente!'
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }else{
                              Navigator.of(context).pop();
                              final snackBar = SnackBar(
                                  margin: const EdgeInsets.all(17),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                                  behavior: SnackBarBehavior.floating,
                                  content: const Text('Error al aceptar al pedido',style: TextStyle(fontSize: 16.0,fontFamily: 'Antipasto'), textAlign: TextAlign.center,),
                                  backgroundColor: const Color.fromARGB(255, 42, 146, 39),
                                  duration: const Duration(seconds: 2),
                                  padding: const EdgeInsets.all(16.0),
                                );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                      },
                    ).show();
                }
              ),
            Column(
              children: const [
                SizedBox(height: 15),
              ],
            ),
        ],
      )
    );
  }
}
