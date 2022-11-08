import 'package:get/get.dart';
import 'package:the_notes/src/core/api/weather_api.dart';
import 'package:the_notes/src/core/models/weaher_model.dart';

class WeatherController extends GetxController with WeatherApi{
  Rx<bool> isVisible = Rx<bool>(false);
  Rxn<WeatherModel> weatherDetails = Rxn<WeatherModel>();

  bool get getVisibility => isVisible.value;
  WeatherModel? get getweatherDetails => weatherDetails.value;

  set setVisibility(bool visible) => isVisible.value = visible;
  set setweatherDetails(WeatherModel data) => weatherDetails.value = data;

  Future<WeatherModel> fetchweatherDetails() async {
    final data = await getWeather();
    if(data is WeatherModel){
      setweatherDetails = data;
    }
    return getweatherDetails?? WeatherModel(temp_c: 0, text: "");
  }
}