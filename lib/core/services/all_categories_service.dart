
import '../helper/api.dart';
import '../constant/constants.dart';

class AllCategoriesService {
  Future<List<dynamic>> getAllCategories() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products/categories',token: Constants.TOKEN);

    return data;
  }
}
