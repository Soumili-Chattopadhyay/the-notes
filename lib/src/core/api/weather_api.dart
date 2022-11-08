
import 'package:the_notes/src/common/constants/app_constants.dart';
import 'package:the_notes/src/common/handlers/http_handler.dart';

class WeatherApi {
  Future<dynamic> getWeather() async {
    final payload = {
      'key': Constants.API_KEY,
      'q': 'Delhi',
      'aqi': 'yes',
    };

    final Uri _weatherUrl =
        Uri.https(Constants.BASE_URL, Constants.API_PATH, payload);

    final HttpHandler _httpHandler = HttpHandler();
    final weatherData = await _httpHandler.httpHandler(_weatherUrl);

    return weatherData;
  }
}
