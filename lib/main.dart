import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/workshop_gdg.dart';

void main() {
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.landscapeRight,
  //   DeviceOrientation.landscapeLeft,
  // ]);

  runApp(new WorkshopGDGApp());
}
