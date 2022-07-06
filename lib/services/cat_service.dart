import 'package:cat_app/models/cat_model.dart';
import 'package:cat_app/services/services.dart';
import 'package:cat_app/utils/utils.dart';

class _CatService extends DioService {
  Future<List<Cat>> getCats() async {
    final response = await getAllData(
      Constans.baseUrl,
      authorization: Constans.apiKey,
    );

    return List<Cat>.from(response.map((json) => Cat.fromJson(json)));
  }
}

final catService = _CatService();
