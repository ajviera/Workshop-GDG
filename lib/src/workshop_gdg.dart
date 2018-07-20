// Detallamos un tipo de librería, para que después podamos únir todos los imports
library workshopgdg;

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

// Acá declaramos cuales son las partes de la aplicación y de esa forma el código esta todo unido
part 'models/user.dart';
part 'pages/hello_page.dart';
part 'pages/home_page.dart';
part 'pages/login_page.dart';
part 'pages/root_page.dart';
part 'pages/user_details_page.dart';
part 'services/auth.dart';
part 'services/base_auth.dart';
part 'widgets/home_drawer.dart';
part 'widgets/primary_button.dart';
part 'widgets/show_login_dialog.dart';
part 'widgets/user_circle_avatar.dart';


// Como se ve, la aplicación en si misma es un.... WIDGET... En particular, en este caso, el mismo 
// es un Widget sin estado, por eso extiende de StatelessWidget
class WorkshopGDGApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // En este caso, vamos usar el diseño de Material Design
    return new MaterialApp(
      // Con esta línea a continuación, hacemos que la app no tenga el flag de Debug
      debugShowCheckedModeBanner: false,
      title: 'Workshop GDG',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new RootPage(auth: new Auth()),
    );
  }
}
