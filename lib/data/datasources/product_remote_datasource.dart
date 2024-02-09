import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mise/core/constants/config.dart';
import 'package:mise/data/models/responses/product_response_model.dart';

class ProductRemoteDatasource {
  Future<Either<String, ProductResponseModel>> getProducts() async {
    final response = await http.get(Uri.parse('${Config.baseUrl}/products'));

    if (response.statusCode == 200) {
      return right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server Error');
    }
  }

  Future<Either<String, ProductResponseModel>> getProductsByCategory(int categoryId) async {
    final response = await http.get(Uri.parse('${Config.baseUrl}/products?category_id=$categoryId'));

    if (response.statusCode == 200) {
      return right(ProductResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server Error');
    }
  }
}
