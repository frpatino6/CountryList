import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pruebaeflower/models/countries.dart';

class CountiresController extends GetxController {
  final result = new Countries().obs;
  RxInt count = 0.obs;

  void getCountries() async {
    try {
      var response =
          await Dio().get('https://restcountries.eu/rest/v2/alpha/col');

      if (response.statusCode == 200) {
        dynamic responseBody = response.data;
        result.value = Countries.fromJson(responseBody);
        _showLog();
      }
    } catch (e) {
      print(e);
    }
  }

  void _showLog() {
    print("==============================================");
    print("Pais ${result.value.name ?? ""}");
    print("Población ${result.value.population ?? ""}");

    print("Fronteras ");

    for (final obj in result.value.borders ?? []) {
      print("   ${obj}");
    }

    for (final obj in result.value.languages ?? []) {
      print("Idiomas ${obj.name}");
    }
    result.value.latlng?.asMap().forEach((key, value) {
      if (key == 0)
        print("Latitud $value");
      else
        print("Longitud $value");
    });
    print("Moneda ");
    result.value.currencies!.forEach((element) {
      print("  ${element.name}");
    });
    print("Bandera ${result.value.flag ?? ""} ");
    print("==============================================");
  }
}
