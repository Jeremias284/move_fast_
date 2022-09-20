import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DatosFleteroScreen extends StatelessWidget {
  //TODO: Le saque el const a Mis Datos Screen
  const DatosFleteroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Datos'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.pushReplacementNamed(context, 'homeFletero');
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Datos del Fletero',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image(image: AssetImage('assets/usuario.png')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
