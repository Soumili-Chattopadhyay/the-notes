class WeatherModel {
  // ignore: non_constant_identifier_names
  double temp_c;
  String text;

  WeatherModel({
    // ignore: non_constant_identifier_names
    required this.temp_c,
    required this.text,
  });

  factory WeatherModel.fromResponse(Map json) {
    return WeatherModel(
        temp_c: json['current']['temp_c'],
        text: json['current']['condition']['text']);
  }
}
