const String _key = "08d63ed532e644aa9cb70117212909";

const String _baseUrl = "https://api.weatherapi.com/v1/";

class ApiHelper {
  ApiHelper._();
  static String currentWeatherUrl(String city) {
    return "${_baseUrl}current.json?key=$_key&q=$city&aqi=yes";
  }

  static String searchLocationUrl(String query) {
    return "${_baseUrl}search.json?key=$_key&q=$query";
  }
}
