// ignore_for_file: file_names, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Theme/Theme.dart';
import '../app/data/data_remote/data_ordersaccepted.dart';
import '../app/data/helpers/http.dart';
import '../app/data/helpers/http_method.dart';

// ignore: use_key_in_widget_constructors
class OrderAcceptedPage extends StatefulWidget {

    @override
    _OrderAcceptedState createState() => _OrderAcceptedState();

}

class _OrderAcceptedState extends State<OrderAcceptedPage>{

  var count = 0;

  List<Data_OrdersAccepted> data = <Data_OrdersAccepted>[];

  // ignore: body_might_complete_normally_nullable
  Future<List<Data_OrdersAccepted>?> cargardatos() async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        // ignore: await_only_futures
        var id = await prefs.getString('id');
        final http = Http(baseUrl: 'https://angelamaria.alwaysdata.net');

        final result = await http.request('/orders?linkTo=status_order,id_userrepartidor_order&equalTo=1,' + id! + '&select=*',
        method: HttpMethod.get,
        headers: {
          "Authorization": "YJEntU7gJwbnqeukvXxnRgNzA3jg9Q",
        },
        );
        if( result.statusCode == 200){
          var datos = result.data['results'];
          var count = result.data['total'];
          var registros = <Data_OrdersAccepted>[];
          for(var i = 0; i < count; i++){
            var datos2 = datos[i];
            registros.add(Data_OrdersAccepted.fromJson(datos2));
          }
          return registros;
        }
  }

  @override
  void initState() {

    super.initState();
    cargardatos().then((value){
      setState(() {
        data.addAll(value!);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      body:count != data.length?  Column(
        children: [
          Column(
                children: const [
                  SizedBox(height: 15),
                  Text('Mis Pedidos',style: TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color: Colors.black,fontFamily: 'Antipasto')),
                ],
              ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index){
                return Container(
                  padding: const EdgeInsets.all(0),
                  child: Card(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(15),
                  elevation: 10,
                  child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        const Text('',style: TextStyle(fontSize: 15,fontWeight: FontWeight.w700)),
                        Text('N° de pedido: '+ data[index].id_order.toString(), style: const TextStyle(fontSize: 16,fontWeight: FontWeight.w700)),],),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Text(' Cliente: ' + data[index].namepickup_order,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w700)),
                        Text(' Dirección: ' + data[index].address_order,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w700)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            FlatButton(color:Colors.green, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(180)), child: const Text('Ver detalles', style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white)),
                          onPressed:(){
                            // String id = data[index].id_order.toString();
                            // Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
                            //    return OrderDetailPage(id,data[index].address_order,data[index].phone_order,data[index].date_order,data[index].namepickup_order);
                            // }
                            // ));
                          },),
                          ],
                        )
                      ] ,),
                      leading: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('',style: TextStyle(fontSize: 5)),
                          Image.network('https://angelamaria3.000webhostapp.com/views/img/users/'+data[index].id_user_order.toString()+'/'+data[index].id_user_order.toString()+'.png',height: 45,width: 45,),
                          ],)
                    ),
                  ],
                ),
                ),
                );
              },
            ),
            ),
        ],
      ) : Container(
        alignment: Alignment.center,
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.library_books_sharp, color: Colors.grey, size: 75,),
          const SizedBox(height: 15),
          Container(
            alignment: Alignment.center,
            child:
              const Text('No hay pedidos aceptados',
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
    );
  }

}
