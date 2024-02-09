import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mise/core/constants/config.dart';
import 'package:mise/data/models/responses/category_response_model.dart';

class CategoryRemoteDatasource {
  Future<Either<String, CategoryResponseModel>> getCategories() async {
    final response = await http.get(Uri.parse('${Config.baseUrl}/categories'));

    if (response.statusCode == 200) {
      return right(CategoryResponseModel.fromJson(response.body));
    } else {
      return const Left('Internal Server Error');
    }
  }
}
