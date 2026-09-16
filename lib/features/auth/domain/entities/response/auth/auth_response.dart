import 'package:new_e_commerce_app/features/auth/domain/entities/response/auth/user.dart';
///pure classes from the model in data
class AuthResponse{
  final String? message;
  final User? user;
  final String? token;

  AuthResponse ({
    this.message,
    this.user,
    this.token,
  });


}




