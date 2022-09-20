import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productos_app/providers/login_usuario_form_provider.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/auth_background_copia.dart';

import 'package:provider/provider.dart';

import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class PrimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackgroundCopia(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      ' Move Fast',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      'Tu Pedido, al Instante',
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),

              const SizedBox(height: 50),

              const SizedBox(height: 50),

              // //TODO: Texto fletero
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'loginFletero'),
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.blue.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(
                    const StadiumBorder(),
                  ),
                ),
                child: Text(
                  '¿Sos fletero?',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              //TODO: Texto pedido
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'loginUsuario'),
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Colors.blue.withOpacity(0.1)),
                  shape: MaterialStateProperty.all(
                    const StadiumBorder(),
                  ),
                ),
                child: Text(
                  '¿Quieres realizar un envio?',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 20,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
