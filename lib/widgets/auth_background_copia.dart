import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthBackgroundCopia extends StatelessWidget {
  final Widget child;

  const AuthBackgroundCopia({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _Box(),
          _HeaderIcon(),
          this.child,
        ],
      ),
    );
  }
}

class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 30),
        child: Container(
          width: double.infinity,
          height: 200,
          child: Image(
            image: AssetImage('assets/logistica.png'),
          ),
        ),
      ),
    );
  }
}

class _Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _Background(),
      child: Stack(
        children: [
          //TODO: Fondo del login, nombre y burbujas de decoracion
          Positioned(
            child: Text(
              '',
              style: GoogleFonts.bebasNeue(
                fontSize: 25,
              ),
            ),
            top: 35,
            left: 35,
          ),
          Positioned(
            child: Text(
              '',
              style: GoogleFonts.bebasNeue(
                fontSize: 11,
              ),
            ),
            top: 75,
            left: 50,
          ),
          Positioned(child: _Bubble(), top: 90, left: 30),
          Positioned(child: _Bubble(), top: -40, left: -30),
          Positioned(child: _Bubble(), top: -50, right: -20),
          Positioned(child: _Bubble(), bottom: -50, left: 10),
          Positioned(child: _Bubble(), bottom: 120, right: 20),
        ],
      ),
    );
  }

  BoxDecoration _Background() => BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 0, 153, 255),
            Color.fromARGB(255, 1, 68, 253)
          ],
        ),
      );
}

class _Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
  }
}
