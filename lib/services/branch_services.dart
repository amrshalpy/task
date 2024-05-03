import 'package:task/model/get_branch_category.dart';
import 'package:task/model/get_branches.dart';
import 'package:http/http.dart' as http;
import 'package:task/utils/const.dart';

class BrancheServices{

static Future<GetBranchesCategory> getBranchesDetails(id)async{
 var response = await http.get(Uri.parse('$kBaseUrl/api/branch/$id/categories'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return getBranchesCategoryFromJson(jsonData);
    } else {
      print(response.statusCode);
      return throw Exception("Failed to load product");
    }
}

}