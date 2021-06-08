import 'package:flutter/material.dart';
import 'package:pruebaeflower/pages/countriesPages.dart';

// Archivo para generar las rutas de la aplicación
Map<String, WidgetBuilder> getApplicationsRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => CountriesPage()
  };
}
