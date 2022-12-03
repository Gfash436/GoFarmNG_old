// Fetch all products
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../../models/products.dart';
import 'dbProvider.dart';
import '../../Constants/url.dart';

//Base Url
final requestBaseUrl = ApiUrl.baseUrl;

class FetchDataProvider extends ChangeNotifier {
  Future<AllProducts> fetchAllProducts() async {
    const String url = "https://gofarm-ng.vercel.app/api/v1/findall";
    // const String url = "https://gofarmng.herokuapp.com/api/v1/findall";
    // const String url = "https://gofarmng.herokuapp.com/api/v1/findall?page=1&limit=5";
    String accessToken = await DatabaseProvider().getToken();
    print("This is the gotten token: $accessToken");
    final headers = {
      "Content-type": "application/json; charset=utf-8",
      "Accept": "/",
      "Authorization": "Bearer $accessToken",
    };
    return http
        .get(
      Uri.parse(url),
      headers: headers,
    )
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);

        return AllProducts.fromJson(jsonData);
      }
      throw Exception("Something is wrong");
    });
  }
}