import 'package:flutter/material.dart';
import 'package:productos_app/screens/loading_screen.dart';
import 'package:productos_app/screens/login_usuario.dart';
import 'package:productos_app/screens/pedido_cliente.screen.dart';
import 'package:productos_app/services/auth_services.dart';
import 'package:productos_app/services/products_services.dart';
import 'package:provider/provider.dart';

class MenuFletero extends StatelessWidget {
  const MenuFletero({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsService = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    if (productsService.isLoading) return LoadingScreen();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const _DrawerHeader(),

          //TODO: Opcion Home
          ListTile(
            leading: const Icon(Icons.house),
            title: const Text('Volver'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'homeFletero');
            },
          ),

          //TODO: Opcion Pedidos
          ListTile(
            leading: const Icon(Icons.wallet_giftcard_outlined),
            title: const Text('Pedidos Recibidos'),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'pedidosFletero');
            },
          ),
          // //TODO: Opcion Pedidos
          // ListTile(
          //   leading: const Icon(Icons.wallet_giftcard_outlined),
          //   title: const Text('Mis Datos'),
          //   onTap: () {
          //     Navigator.pushReplacementNamed(context, 'misDatosFletero');
          //   },
          // ),

          //TODO: Opcion LogOut
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Salir'),
            onTap: () {
              authService.logout();
              Navigator.pushReplacementNamed(context, 'primerScreen');
            },
          ),
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Container(
        decoration: const BoxDecoration(
          //TODO: Imagen de fondo del Home
          image: DecorationImage(
            image: AssetImage('assets/delivery.png'),
          ),
        ),
      ),
    );
  }
}
