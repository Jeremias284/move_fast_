// ignore_for_file: sort_child_properties_last, unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:productos_app/models/models.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 300,
        decoration: _cardBorders(),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            //TODO: Imagen y atributos que estan visibles en los productos
            _BackgroundImage(product.picture),
            _ProductDetails(
              nombre: product.nombre,
              apellido: product.apellido,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: const Offset(0, 7),
            blurRadius: 10,
          )
        ],
      );
}

//TODO: Check de ejemplo
// class _NotAvailable extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: const FittedBox(
//         fit: BoxFit.contain,
//         child: const Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: const Text(
//             'No Entregado',
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//         ),
//       ),
//       width: 100,
//       height: 70,
//       decoration: BoxDecoration(
//         color: Colors.yellow[800],
//         borderRadius: const BorderRadius.only(
//           topLeft: Radius.circular(25),
//           bottomRight: Radius.circular(25),
//         ),
//       ),
//     );
//   }
// }

// class _PriceTag extends StatelessWidget {
//   final double price;

//   const _PriceTag({required this.price});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: FittedBox(
//         fit: BoxFit.contain,
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10),
//           child: Text(
//             '\$$price',
//             style: TextStyle(color: Colors.white, fontSize: 20),
//           ),
//         ),
//       ),
//       alignment: Alignment.center,
//       width: 100,
//       height: 70,
//       decoration: const BoxDecoration(
//         color: Colors.blue,
//         borderRadius: const BorderRadius.only(
//           topRight: Radius.circular(25),
//           bottomLeft: Radius.circular(25),
//         ),
//       ),
//     );
//   }
// }

class _ProductDetails extends StatelessWidget {
  //TODO: Declaracion de variables que se van a mostrar posteriormente en el producto
  final String nombre;
  final String apellido;

  const _ProductDetails({
    required this.nombre,
    required this.apellido,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 220),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 80,
        decoration: _buildBoxDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              nombre,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              apellido,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => const BoxDecoration(
        color: Colors.blue,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      );
}

class _BackgroundImage extends StatelessWidget {
  final String? url;

  const _BackgroundImage(this.url);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 300,
        child: url == null
            ? Image(
                //TODO: Fondo de no imagen , en caso de que el producto no tenga imagen
                image: AssetImage('assets/no-image.png'),
                fit: BoxFit.cover,
              )
            : FadeInImage(
                //TODO: Imagen de carga al esperar que aparezca que aparezca la imagen correspondiente
                placeholder: const AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(url!),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
