import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mise/core/constants/config.dart';
import 'package:mise/data/datasources/auth_local_datasource.dart';
import 'package:mise/data/models/requests/address_request_model.dart';
import 'package:mise/data/models/responses/address_response_model.dart';

class AddressRemoteDatasource {
  Future<Either<String, AddressResponseModel>> getAllAddress() async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.get(
      Uri.parse('${Config.baseUrl}/addresses'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData!.token}',
      },
    );
    if (response.statusCode == 200) {
      return right(AddressResponseModel.fromJson(response.body));
    } else {
      return left('Internal Server Error');
    }
  }

  Future<Either<String, String>> createNewAddress(AddressRequestModel data) async {
    final authData = await AuthLocalDatasource().getAuthData();
    final response = await http.post(
      Uri.parse('${Config.baseUrl}/addresses'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${authData!.token}',
        'Content-type': 'application/json',
      },
      body: data.toJson(),
    );
    if (response.statusCode == 201) {
      return right('Success');
    } else {
      return left('Internal Server Error');
    }
  }
}
