abstract class AbstractNetworkService {
  String? url;
  Future getWeather(String apikey, String city, String lang, int days);
}
