
import 'dart:async';
import 'dart:io';

import 'package:app_angela_maria/app/data/helpers/http.dart';
import 'package:app_angela_maria/app/data/helpers/http_method.dart';
import 'package:app_angela_maria/app/domain/responses/login_response.dart';

class AutenticationAPI{

  final Http _http;


  AutenticationAPI(this._http);

  Future<LoginResponse> login(String email, String password) async{
    final result = await _http.request('/users?login=true&suffix=user',
    method: HttpMethod.post,
    headers: {
      "Authorization": "YJEntU7gJwbnqeukvXxnRgNzA3jg9Q",
    },
    body: {
      "email_user": email,
      "password_user": password,
    },
    );

    // print("result data ${result.data}");
    // print("result data runtimeType ${result.data.runtimeType}");
    // print("result error data ${result.error?.data}");
    // print("result statusCode ${result.statusCode}");

    if(result.error == null){
        return LoginResponse.ok;
    }
    if(result.statusCode == 400){
        return LoginResponse.accessDenied;
    }

    final error = result.error!.exception;

    if(error is SocketException || error is TimeoutException){
      return LoginResponse.networkError;

    }
    return LoginResponse.unknownError;

  }

}

