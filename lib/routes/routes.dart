// ignore_for_file: file_names


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../pages/OrderAccepted.dart';
import '../pages/OrderRequestPage.dart';
import '../pages/DashboardPage.dart';
import '../pages/PaginaFavorito.dart';
import '../pages/ProfilePage.dart';
import '../theme/Theme.dart';


// ignore: use_key_in_widget_constructors
class Routes extends StatefulWidget{

  @override
  _RouteState createState() => _RouteState();
}
class _RouteState extends State<Routes>{

  final navigationKey = GlobalKey<CurvedNavigationBarState>();

    int index = 2;

    final screens = [

    OrderRequestPage(),
    OrderAcceptedPage(),
    DashboardPage(),
    PaginaFavorito(),
    ProfilePage(),

  ];


  @override
  Widget build(BuildContext context) {

    final items = <Widget>[

          const Icon(Icons.list,size: 30,),
          const Icon(Icons.library_books_sharp,size: 30,),
          const Icon(Icons.home,size: 30,),
          const Icon(Icons.settings,size: 30,),
          const Icon(Icons.person,size: 30,),

        ];

        var parametros = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;


          var id = parametros['id'].toString();
          var url = "https://angelamaria3.000webhostapp.com/views/img/users/"+id+"/"+parametros['image'];
          return Scaffold(
                extendBody: true,
                backgroundColor: kWhiteColor,
                appBar: AppBar(
                    title:Row(
                      children: [
                        Container(
                          height: 45.0,
                          width: 45.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                  url
                                ),
                                fit: BoxFit.cover,
                              ),
                              ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              // ignore: prefer_adjacent_string_concatenation
                              ' '+' '+parametros['nombre']+',',
                              style: whiteTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: medium,
                                fontFamily: 'Antipasto',
                              ),
                            ),
                            Text(
                              ' ',
                              style: whiteTextStyle.copyWith(
                                fontWeight: regular,
                                fontSize: 3,
                                fontFamily: 'Antipasto'
                              ),
                            ),
                            Text(
                              // ignore: prefer_adjacent_string_concatenation
                              ' '+' '+' Bienvenido!',
                              style: whiteTextStyle.copyWith(
                                fontWeight: regular,
                                fontSize: 16,
                                fontFamily: 'Antipasto'
                              ),
                            ),

                          ],
                        )
                      ]

                    ),
                actions: <Widget>[
                    IconButton(
                      icon: const Icon(Icons.notifications, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/Notification');
                      },
                    ),
                  ],
                elevation: 0,
                centerTitle: false,
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                    gradient: Kcolorgradient,
                  ),
                ),
                ),
                body: screens[index],
                bottomNavigationBar: Theme(data: Theme.of(context).copyWith(
                  iconTheme: const IconThemeData(color: Colors.white),
                ),
                child: CurvedNavigationBar(key: navigationKey,
                buttonBackgroundColor: const Color.fromARGB(255, 23, 104, 170),
                color: Colors.green,
                backgroundColor: Colors.transparent,
                height: 60,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 300),
                index: index,
                items: items,
                onTap: (index) => setState(() => this.index = index ),
                ),
              )
                );

  }
}
