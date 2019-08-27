import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);
  Future getData() async {
    try {
      Response response = await get(this.url);
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        return decodedData;
      }
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
