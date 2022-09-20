import 'dart:convert';
//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseToken = 'AIzaSyCVlXn1uJNmVNZJv0UyE9_wIDNFyFsrL9U';

  final storage = new FlutterSecureStorage();

  //TODO: Si retornamos algo, es un error, si no, todo bien!

  //TODO: Funcion Crear Usuario
  Future<String?> createUser(
    // String nombre,
    // String apellido,
    String email,
    String password,
    //Int telefono,
  ) async {
    final Map<String, dynamic> authData = {
      // 'nombre': nombre,
      // 'apellido': apellido,
      'email': email,
      'password': password,
      'returnSecureToken': true
      //'telefono': telefono,
    };

    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseToken});

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      //TODO: Token hay que guardarlo en un lugar seguro
      await storage.write(key: 'token', value: decodedResp['idToken']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  //TODO: Funcion de Login
  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authData = {
      'email': email,
      'password': password,
      'returnSecureToken': true
    };

    final url = Uri.https(
      _baseUrl,
      '/v1/accounts:signInWithPassword',
      {'key': _firebaseToken},
    );

    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);

    if (decodedResp.containsKey('idToken')) {
      //TODO: Token hay que guardarlo en un lugar seguro
      await storage.write(key: 'token', value: decodedResp['idToken']);
      return null;
    } else {
      return decodedResp['error']['message'];
    }
  }

  //TODO: Funcion de Cerrar Sesion, se elimina el token
  Future logout() async {
    await storage.delete(key: 'token');
    return;
  }

  //TODO: Funcion que lee los token
  Future<String> readToken() async {
    return await storage.read(key: 'token') ?? '';
  }
}
