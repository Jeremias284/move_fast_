// ignore_for_file: sort_child_properties_last, curly_braces_in_flow_control_structures, prefer_is_empty, unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'package:provider/provider.dart';
import 'package:productos_app/providers/product_form_provider.dart';

import 'package:productos_app/services/services.dart';

import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productService = Provider.of<ProductsService>(context);

    return ChangeNotifierProvider(
      create: (_) => ProductFormProvider(productService.selectedProduct),
      child: _ProductScreenBody(productService: productService),
    );
  }
}

class _ProductScreenBody extends StatelessWidget {
  const _ProductScreenBody({
    Key? key,
    required this.productService,
  }) : super(key: key);

  final ProductsService productService;

  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            Stack(
              children: [
                //TODO: Icono de Fotos
                ProductImage(url: productService.selectedProduct.picture),
                //TODO: Posicionaminto del Icono para sacar fotos
                Positioned(
                    top: 60,
                    left: 20,
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.arrow_back_ios_new,
                          size: 40, color: Colors.white),
                    )),
                Positioned(
                  top: 60,
                  right: 20,
                  child: IconButton(
                    //TODO: Validacion
                    onPressed: () async {
                      final picker = new ImagePicker();
                      final PickedFile? pickedFile = await picker.getImage(
                        // source: ImageSource.gallery,
                        source: ImageSource.camera,
                        imageQuality: 100,
                      );

                      if (pickedFile == null) {
                        print('No seleccionó nada');
                        return;
                      }

                      productService
                          .updateSelectedProductImage(pickedFile.path);
                    },
                    icon: const Icon(Icons.camera_alt_outlined,
                        size: 40, color: Colors.white),
                  ),
                ),
              ],
            ),
            _ProductForm(),
            const SizedBox(height: 100),
          ],
        ),
      ),

      //TODO: Boton de guardar el nuevo producto
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: productService.isSaving
            ? const CircularProgressIndicator(color: Colors.white)
            : const Icon(Icons.save_outlined),
        //TODO: Validacion
        onPressed: productService.isSaving
            ? null
            : () async {
                if (!productForm.isValidForm()) return;

                final String? imageUrl = await productService.uploadImage();

                if (imageUrl != null) productForm.product.picture = imageUrl;

                await productService.saveOrCreateProduct(productForm.product);
              },
      ),
    );
  }
}

class _ProductForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productForm = Provider.of<ProductFormProvider>(context);
    final product = productForm.product;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: _buildBoxDecoration(),
        child: Form(
          key: productForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(height: 10),

              //TODO: Nombre del Usuario
              TextFormField(
                initialValue: product.nombre,
                onChanged: (value) => product.nombre = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El nombre es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Nombre del producto',
                  labelText: 'Nombre:',
                ),
              ),

              const SizedBox(height: 30),

              //TODO: Apellido del Usuario
              TextFormField(
                initialValue: product.apellido,
                onChanged: (value) => product.apellido = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'El apellido es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Apellido del Usuario',
                  labelText: 'Apellido:',
                ),
              ),

              const SizedBox(height: 30),

              //TODO: Telefono del Uusario
              TextFormField(
                initialValue: '${product.telefono}',
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La direccion de origen es obligatorio';
                },
                onChanged: (value) {
                  if (int.tryParse(value) == null) {
                    product.telefono = 0;
                  } else {
                    product.telefono = int.parse(value);
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecorations.authInputDecoration(
                  hintText: '',
                  labelText: 'Telefono:',
                ),
              ),

              // //TODO: Direccion de Origen del Producto
              TextFormField(
                initialValue: product.direccionOrigen,
                onChanged: (value) => product.direccionOrigen = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La direccion de origen es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Direccion de Origen',
                  labelText: 'Direccion de Origen:',
                ),
              ),

              const SizedBox(height: 30),

              // //TODO: Direccion de Destino del Producto
              TextFormField(
                initialValue: product.direccionDestino,
                onChanged: (value) => product.direccionDestino = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La direccion de destino es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Direccion de Destino',
                  labelText: 'Direccion de Destino:',
                ),
              ),

              const SizedBox(height: 30),

              // //TODO: Descripcion del Producto
              TextFormField(
                initialValue: product.descripcion,
                onChanged: (value) => product.descripcion = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'La descripcion es obligatorio';
                },
                decoration: InputDecorations.authInputDecoration(
                  hintText: 'Descripcion del producto',
                  labelText: 'Desripcion:',
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _buildBoxDecoration() => BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: const Radius.circular(25),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 5),
              blurRadius: 5,
            )
          ]);
}
