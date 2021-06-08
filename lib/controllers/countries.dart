import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pruebaeflower/models/countries.dart';

class CountiresController extends GetxController  {
  final result = new Countries().obs;
  RxInt count =0.obs;
  void getCountries() async {
    try {
      var response =
          await Dio().get('https://restcountries.eu/rest/v2/alpha/col');
      print(response);

      if (response.statusCode == 200) {
        dynamic responseBody = response.data;
        result.value = Countries.fromJson(responseBody);

      }
    } catch (e) {
      print(e);
    }
  }
}
