// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class FootterLogin extends StatelessWidget{
  const FootterLogin({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
                          padding: const EdgeInsets.only(top: 50, right: 30, left: 30),
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: 'Al iniciar sesión estás de acuerdo con nuestros',
                              style:  const TextStyle(fontSize: 16, color: Colors.grey, fontFamily: 'Antipasto'),
                              children: <TextSpan>[
                                TextSpan(text: ' Términos y condiciones ',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.cyan, fontFamily: 'Antipasto'),
                                    recognizer: TapGestureRecognizer()..onTap = (){
                                      Navigator.of(context).pushNamed('/TermsConditions');
                                    }
                                ),
                                const TextSpan(text: ' y ' , style: TextStyle(fontFamily: 'Antipasto')),
                                TextSpan(
                                    text: 'Política de privacidad',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.cyan, fontFamily: 'Antipasto'),
                                    recognizer: TapGestureRecognizer()..onTap = (){
                                      Navigator.of(context).pushNamed('/PrivacyPolicy');
                                    }
                                ),
                              ],
                            ),
                          ),
                        );
  }
}