import 'dart:convert';

import 'package:api_integration_2/model/home_screen_models/us_data_res_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreenController with ChangeNotifier {
  UsDataResModel? dataModel;

  fetchData() async {
    final url = Uri.parse(
        "https://datausa.io/api/data?drilldowns=Nation&measures=Population");

    final responseData = await http.get(url);
    if (responseData.statusCode == 200) {
      dataModel = usDataResModelFromJson(responseData.body);
      print(dataModel?.usDataList?[0].population.toString());
    }
    notifyListeners();
  }
}
// https://datausa.io/api/data?drilldowns=Nation&measures=Population