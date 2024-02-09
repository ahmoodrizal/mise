import 'package:dartz/dartz.dart';
import 'package:mise/core/constants/config.dart';
import 'package:mise/data/datasources/auth_local_datasource.dart';
import 'package:mise/data/models/responses/auth_response_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('${Config.baseUrl}/login'),
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(response.body));
    } else {
      return Left(response.body);
    }
  }

  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('${Config.baseUrl}/logout'),
      headers: {
        'Authorization': 'Bearer ${authData?.token}',
      },
    );
    if (response.statusCode == 200) {
      AuthLocalDatasource().removeAuthData();
      return right(response.body);
    } else {
      return left(response.body);
    }
  }

  Future<Either<String, String>> updateFcmToken(String fcmToken) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('${Config.baseUrl}/update-fcm'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData?.token}',
      },
      body: {
        'fcm_id': fcmToken,
      },
    );

    if (response.statusCode == 200) {
      return right('Success');
    } else {
      return left('Internal Server Error');
    }
  }
}
