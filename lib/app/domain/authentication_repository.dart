import 'responses/login_response.dart';

abstract class AutenticationRepository{
  
  Future<LoginResponse> login(String email, String password);

}

