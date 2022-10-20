import 'dart:convert' as convert;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/service/abstract_network_service.dart';

class HttpNetworkService implements AbstractNetworkService {
  @override
  String? url = "https://api.weatherapi.com/v1/forecast.json?key=";

  @override
  Future getWeather(String apikey, String city, String lang, int days) async {
    try {
      // ignore: unnecessary_brace_in_string_interps
      var url = Uri.parse("${this.url}${apikey}&q=$city&lang=$lang&days=$days");
      var response = await http.get(url);
      // ignore: prefer_interpolation_to_compose_strings
      return convert.jsonDecode(
          // ignore: prefer_interpolation_to_compose_strings
          utf8.decode(response.bodyBytes)) as Map<String, dynamic>;
      /*return convert.jsonDecode(
              // ignore: prefer_interpolation_to_compose_strings
              "{\"results\": [" + utf8.decode(response.bodyBytes) + "]}")
          as Map<String, dynamic>;*/
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
      rethrow; //Exception("Network Error");
    }
  }
}
