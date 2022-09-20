import 'package:flutter/material.dart';
import 'package:productos_app/screens/datos_fletero.dart';
import 'package:productos_app/screens/home_screen_fletero.dart';
import 'package:productos_app/screens/login_fletero.dart';
import 'package:productos_app/screens/datos_cliente.dart';
import 'package:productos_app/screens/pedido_cliente.screen.dart';
import 'package:productos_app/screens/pedidos_fleteros_screen.dart';
import 'package:productos_app/screens/primer_screen.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ProductsService()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO:CODIGO PARA SEGUIR ADELANTE
    // WidgetsFlutterBinding.ensureInitialized();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos App',
      //TODO: Ruta donde iniciara la aplicacion
      initialRoute: 'primerScreen',
      routes: {
        //TODO: Declaracion de rutas para las pantallas
        'loginUsuario': (_) => LoginUsuarioScreen(),
        'loginFletero': (_) => LoginFleteroScreen(),
        'primerScreen': (_) => PrimerScreen(),
        'misDatos': (_) => DatosClienteScreen(),
        'misDatosFletero': (_) => DatosFleteroScreen(),
        'register': (_) => RegisterScreen(),
        'home': (_) => HomeScreenCliente(),
        'homeFletero': (_) => HomeScreenFletero(),
        'product': (_) => ProductScreen(),
        'checking': (_) => CheckAuthScreen(),
        'pedidos': (_) => PedidosScreen(),
        'pedidosFletero': (_) => PedidosFleteroScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      //TODO: Especificacion de colores parala aplicacion
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[300],
        appBarTheme: const AppBarTheme(
          elevation: 0,
          color: Colors.blue,
        ),
        //TODO: Declaracion de color para el boton de accion
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
      ),
    );
  }
}
