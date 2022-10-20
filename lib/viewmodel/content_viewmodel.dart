import 'package:flutter/widgets.dart';
import 'package:weather_app/helper/variable_helper.dart';
import '../config/config.dart';

enum ServiceStatus {
  idle,
  busy,
  completed,
  error,
}

class ContentViewModel extends ChangeNotifier with VariableHelper {
  //List<Weather> weather = [];
  ServiceStatus? _serviceStatus;
  ContentViewModel() {
    _serviceStatus = ServiceStatus.idle;
  }
  ServiceStatus get serviceStatus => _serviceStatus!;

  set serviceStatus(ServiceStatus serviceStatus) {
    _serviceStatus = serviceStatus;
    notifyListeners();
  }

  Future<void> getWeather(String cityName) async {
    serviceStatus = ServiceStatus.idle;
    notifyListeners();
    // ignore: prefer_typing_uninitialized_variables
    late var jsonResponse;
    serviceStatus = ServiceStatus.busy;
    notifyListeners();
    try {
      jsonResponse = await networkService.getWeather(
          // ignore: unnecessary_string_interpolations
          "46cdf874331745fdb1e74556221810",
          // ignore: unnecessary_string_interpolations
          "$cityName",
          "tr",
          1);
      cityNameSet = jsonResponse['location']['name'];
      pictureSet = jsonResponse['forecast']['forecastday'][0]['day']
          ['condition']['icon'];
      weatherstateSet = jsonResponse['forecast']['forecastday'][0]['day']
          ['condition']['text'];
      lastUpdateSet = jsonResponse['current']['last_updated'];

      maxTempSet =
          jsonResponse['forecast']['forecastday'][0]['day']['maxtemp_c'];

      /*for (var i = 0; i < jsonResponse["results"].length; i++) {
        var currentUser = Weather.fromJson(jsonResponse["results"][i]);
        weather.add(currentUser);
      }*/
      serviceStatus = ServiceStatus.completed;
      notifyListeners();
    } catch (e) {
      serviceStatus = ServiceStatus.error;
      // ignore: avoid_print
      print(e.toString());
    }
    notifyListeners();
  }
}
