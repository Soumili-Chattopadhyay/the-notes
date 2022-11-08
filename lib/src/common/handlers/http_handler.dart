import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_notes/src/core/models/weaher_model.dart';

class HttpHandler {
  Future<dynamic> httpHandler(Uri weatherUrl) async {
    try {
      final response = await http.get(weatherUrl);
      if(response.statusCode == 200){
        final resp = jsonDecode(response.body);
        return WeatherModel.fromResponse(resp);
      }
      else{
        throw Exception(response.statusCode);
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
