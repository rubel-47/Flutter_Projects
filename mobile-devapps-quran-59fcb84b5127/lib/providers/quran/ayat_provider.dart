import 'package:http/http.dart' as http;
import 'package:qrf/utils/constant.dart';

class AyatProvider{

  Future<dynamic> getAyatBySurah(var surahId) async {
    var client = http.Client();


    try {
      var response = await client.get(
        Uri.parse(
            "${BASE_URL + endpoint_ayat}$surahId"),
        headers: {"Accept": "application/json", "$API_KEY": "$API_SECRET"},
      );

      if (response.statusCode == 200) {
        //print(response.body.toString());
        return response.body;
      } else {
        return Future.error("Something went wrong");
      }
    } catch (Exception) {
      return Exception.toString();
    }
  }
}