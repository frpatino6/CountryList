import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pruebaeflower/controllers/countries.dart';

class CountriesPage extends StatelessWidget {
  CountiresController countriesController = Get.put(CountiresController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-FLOWER"),
      ),
      body: SingleChildScrollView(child: (_createBody(context))),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countriesController.getCountries();
        },
        child: const Icon(Icons.list),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _createBody(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  replacement: Container(
                    height: MediaQuery.of(context).size.height*.90,
                    child: Center(
                      child: Text(
                        "NO HAY DATA",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  visible: countriesController.result.value.name == null
                      ? false
                      : true,
                  child: Column(
                    children: [
                      _createCountrieRow(),
                      _createCountriePopulationRow(),
                      _createCountryBorders(),
                      _createLanguage(),
                      _createLatitude(),
                      _createCurrency(),
                      _createflag()
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget _createCountriePopulationRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "POBLACIÓN",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Card(
              color: Colors.transparent,
              child: ListTile(
                  title: Text(
                      countriesController.result.value.population == null
                          ? ""
                          : countriesController.result.value.population
                              .toString(),
                      style: TextStyle(color: Colors.white)))),
        ],
      ),
    );
  }

  Widget _createCountrieRow() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PAIS",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          Card(
              color: Colors.transparent,
              child: ListTile(
                  title: Text(
                countriesController.result.value.name ?? "",
                style: TextStyle(color: Colors.white),
              ))),
        ],
      ),
    );
  }

  Widget _createCountryBorders() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: countriesController.result.value.borders == null
            ? 0
            : countriesController.result.value.borders!.length,
        itemBuilder: (context, index) {
          final item = countriesController.result.value.borders![index];
          if (index == 0) {
            return Text(
              "FONTERAS",
              style: TextStyle(fontSize: 20, color: Colors.white),
            );
          } else
            return Card(
                color: Colors.transparent, child: ListTile(title: Text(item)));
        },
      ),
    );
  }

  Widget _createLanguage() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: countriesController.result.value.languages == null
            ? 0
            : countriesController.result.value.languages!.length,
        itemBuilder: (context, index) {
          final item = countriesController.result.value.languages![index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "LENGUAJES",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Card(
                  color: Colors.transparent,
                  child: ListTile(title: Text(item.nativeName!))),
            ],
          );
        },
      ),
    );
  }

  Widget _createLatitude() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: countriesController.result.value.latlng == null
            ? 0
            : countriesController.result.value.latlng!.length,
        itemBuilder: (context, index) {
          final item = countriesController.result.value.latlng![index];
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "LATITUD",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Card(
                    color: Colors.transparent,
                    child: ListTile(title: Text(item.toString()))),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "LONGITUD",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Card(
                    color: Colors.transparent,
                    child: ListTile(title: Text(item.toString()))),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _createCurrency() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: countriesController.result.value.currencies == null
            ? 0
            : countriesController.result.value.currencies!.length,
        itemBuilder: (context, index) {
          final item = countriesController.result.value.currencies![index];
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "MONEDAS",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Card(
                    color: Colors.transparent,
                    child: ListTile(title: Text(item.name.toString()))),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                    color: Colors.transparent,
                    child: ListTile(title: Text(item.name.toString()))),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _createflag() {
    if (countriesController.result.value.flag != null)
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: SvgPicture.network(
          countriesController.result.value.flag ?? "",
          placeholderBuilder: (context) => CircularProgressIndicator(),
          height: 128.0,
        ),
      );
    else
      return Container();
  }
}
