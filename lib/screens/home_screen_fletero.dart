// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productos_app/screens/loading_screen.dart';
import 'package:productos_app/services/auth_services.dart';
import 'package:productos_app/services/products_services.dart';
import 'package:productos_app/widgets/menu_cliente.dart';
import 'package:productos_app/widgets/menu_fletero.dart';
import 'package:provider/provider.dart';

class HomeScreenFletero extends StatelessWidget {
  static const String routerName = 'Home';
  // final VoidCallback showPedidosPage;
  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    if (productsService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      drawer: const MenuFletero(),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Menu Fletero',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 30,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Image(image: AssetImage('assets/usuario.png')),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
