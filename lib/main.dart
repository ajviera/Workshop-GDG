import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/workshop_gdg.dart';

// El metodo main, es el encargado de iniciar la aplicación
// Acá se puede hacer un set up previo, como es la orientación de las vistas
void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.landscapeRight,
  //   DeviceOrientation.landscapeLeft,
  // ]);

  runApp(new WorkshopGDGApp());
}
