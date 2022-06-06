import 'package:app_angela_maria/app/data/data_source/remote/authentication_api.dart';
import 'package:app_angela_maria/app/domain/authentication_repository.dart';
import 'package:app_angela_maria/app/domain/responses/login_response.dart';

class AutenticationRepositoryImpl implements AutenticationRepository{

   final AutenticationAPI _api;

   AutenticationRepositoryImpl(this._api);
  // @override
  // Future<String?> get accessToken async{
  //   await Future.delayed(const Duration(seconds: 1));
  //   return "null";
  // }

  @override
  Future<LoginResponse> login(String email, String password) {
    return _api.login(email, password);
  }
}