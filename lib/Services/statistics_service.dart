import 'dart:convert';
import 'package:covid19_app/Model/world_statistics_model.dart';
import 'package:covid19_app/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;

class StatisticsService {
  Future<WorldStatisticsModel> fetchWorldStats() async {
    final response = await http.get(
        Uri.parse(AppUrl.worldStatisticsApi)); // AppUrl.worldStatisticsApi ????
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatisticsModel.fromJson(data); // WHAT and HOW??
    } else {
      throw Exception('Error');
    }
  }

  // Another Future Function
  Future<List<dynamic>> countriesListApi() async {
    // Variable
    dynamic data;
    final response = await http
        .get(Uri.parse(AppUrl.countriesList)); // AppUrl.worldStatisticsApi ????
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data; // WHAT and HOW??
    } else {
      throw Exception('Error');
    }
  }
}
