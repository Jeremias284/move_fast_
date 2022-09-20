import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Pagina de espera , cuando ingresa al sistema
      appBar: AppBar(
        title: const Text(''),
      ),
      body: const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ),
    );
  }
}
