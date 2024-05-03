import 'package:task/model/get_branches.dart';
import 'package:http/http.dart' as http;
import 'package:task/utils/const.dart';

class HomeServices{

static Future<GetBranches> getBranches()async{
 var response = await http.get(Uri.parse('$kBaseUrl/api/branches'));

    if (response.statusCode == 200) {
      var jsonData = response.body;
      return getBranchesFromJson(jsonData);
    } else {
      return throw Exception("Failed to load product");
    }
}

}