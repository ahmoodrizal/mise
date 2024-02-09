import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mise/core/constants/config.dart';
import 'package:mise/data/models/responses/city_response_model.dart';
import 'package:mise/data/models/responses/cost_response_model.dart';
import 'package:mise/data/models/responses/province_response_model.dart';
import 'package:mise/data/models/responses/subdistrict_response_model.dart';
import 'package:mise/data/models/responses/waybill_response_model.dart';

class RajaOngkirRemoteDatasource {
  Future<Either<String, ProvinceResponseModel>> getProvince() async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/province');
    final response = await http.get(
      url,
      headers: {
        'key': Config.rajaOngkirKey,
      },
    );
    return response.statusCode == 200 ? right(ProvinceResponseModel.fromJson(response.body)) : left('Error');
  }

  Future<Either<String, CityResponseModel>> getCitiesByProvince(String provinceId) async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/city?province=$provinceId');
    final response = await http.get(
      url,
      headers: {
        'key': Config.rajaOngkirKey,
      },
    );
    return response.statusCode == 200 ? right(CityResponseModel.fromJson(response.body)) : left('Error');
  }

  Future<Either<String, SubdistrictResponseModel>> getSubdistrictByCity(String cityId) async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/subdistrict?city=$cityId');
    final response = await http.get(
      url,
      headers: {
        'key': Config.rajaOngkirKey,
      },
    );
    return response.statusCode == 200 ? right(SubdistrictResponseModel.fromJson(response.body)) : left('Error');
  }

  Future<Either<String, CostResponseModel>> getShippingCost({
    required String origin,
    required String destination,
    String? courier,
    String? weight,
  }) async {
    const String url = 'https://pro.rajaongkir.com/api/cost';
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'key': Config.rajaOngkirKey,
      },
      body: {
        'origin': origin,
        'originType': 'subdistrict',
        'destination': destination,
        'destinationType': 'subdistrict',
        'weight': weight ?? '1000',
        'courier': courier ?? 'jne',
      },
    );

    if (response.statusCode == 200) {
      return right(CostResponseModel.fromJson(response.body));
    } else {
      return left('Internal Server Error');
    }
  }

  Future<Either<String, WaybillResponseModel>> getWaybill(String resi, String courier) async {
    final url = Uri.parse('https://pro.rajaongkir.com/api/waybill');
    final response = await http.post(
      url,
      headers: {
        'key': Config.rajaOngkirKey,
      },
      body: {
        'waybill': resi,
        'courier': courier,
      },
    );
    if (response.statusCode == 200) {
      return right(WaybillResponseModel.fromJson(response.body));
    } else {
      return left('Internal Server Error');
    }
  }
}
