import 'package:task/model/get_branch_category.dart';
import 'package:task/model/get_branches.dart';
import 'package:http/http.dart' as http;
import 'package:task/model/get_product.dart';
import 'package:task/utils/const.dart';

class ProductServices{

static Future<GetProducts> getProducts(branchId,categoryId)async{
 var response = await http.get(Uri.parse('$kBaseUrl/api/branch/$branchId/category/$categoryId/products?paginate=10&page=1'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return getProductsFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
}

}