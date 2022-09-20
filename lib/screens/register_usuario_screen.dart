// ignore_for_file: unnecessary_const, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:productos_app/providers/login_usuario_form_provider.dart';
import 'package:productos_app/services/services.dart';
import 'package:provider/provider.dart';

import 'package:productos_app/ui/input_decorations.dart';
import 'package:productos_app/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 250),

              //TODO: Contenedor de la card de los input registrar
              CardContainer(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      'Crear Cuenta',
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    const SizedBox(height: 30),
                    ChangeNotifierProvider(
                      create: (_) => LoginFormProvider(),
                      child: _LoginForm(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              //TODO: Texto para volver al login en caso de tener cuenta
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, 'loginUsuario'),
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                    Colors.blue.withOpacity(0.1),
                  ),
                  shape: MaterialStateProperty.all(const StadiumBorder()),
                ),
                child: const Text(
                  '¿Ya tienes una cuenta?',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
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

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);

    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            // //TODO: Input de Nombre
            // TextFormField(
            //   autocorrect: false,
            //   obscureText: false,
            //   keyboardType: TextInputType.name,
            //   decoration: InputDecorations.authInputDecoration(
            //     hintText: 'Nombre',
            //     labelText: 'Nombre',
            //     prefixIcon: Icons.person,
            //   ),
            //   //TODO: Validacion
            //   onChanged: (value) => loginForm.nombre = value,
            //   validator: (value) {
            //     return (value != null && value.length >= 3)
            //         ? null
            //         : 'Debe completar bien los campos de nombre';
            //   },
            // ),
            // const SizedBox(height: 30),

            // //TODO: Input Apellido
            // TextFormField(
            //   autocorrect: false,
            //   obscureText: false,
            //   keyboardType: TextInputType.name,
            //   decoration: InputDecorations.authInputDecoration(
            //     hintText: 'Apellido',
            //     labelText: 'Apellido',
            //     prefixIcon: Icons.supervised_user_circle_outlined,
            //   ),
            //   //TODO: Validar
            //   onChanged: (value) => loginForm.apellido = value,
            //   validator: (value) {
            //     return (value != null && value.length >= 3)
            //         ? null
            //         : 'El apellido debe de ser de 6 caracteres';
            //   },
            // ),
            // const SizedBox(height: 30),

            //TODO: Input Correo
            TextFormField(
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: 'john.doe@gmail.com',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.alternate_email_rounded,
              ),

              //TODO: Validar
              onChanged: (value) => loginForm.email = value,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo';
              },
            ),
            const SizedBox(height: 30),

            //TODO: Input de Contraseña
            TextFormField(
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline,
              ),
              onChanged: (value) => loginForm.password = value,
              validator: (value) {
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';
              },
            ),
            const SizedBox(height: 30),

            //TODO: Input de Telefono
            // TextFormField(
            //   autocorrect: false,
            //   obscureText: true,
            //   keyboardType: TextInputType.phone,
            //   decoration: InputDecorations.authInputDecoration(
            //     hintText: 'Telefono',
            //     labelText: 'Telefono',
            //     prefixIcon: Icons.phone,
            //   ),
            //   //TODO: Validacion
            //   onChanged: (value) => loginForm.password = value,
            //   validator: (value) {
            //     return (value != null && value.length >= 6)
            //         ? null
            //         : 'La contraseña debe de ser de 6 caracteres';
            //   },
            // ),
            const SizedBox(height: 30),

            //TODO: Boton de Ingresar
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Colors.blue,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                child: Text(
                  loginForm.isLoading ? 'Espere' : 'Ingresar',
                  style: const TextStyle(color: Colors.white),
                ),
              ),

              //TODO: Validacion
              onPressed: loginForm.isLoading
                  ? null
                  : () async {
                      FocusScope.of(context).unfocus();
                      final authService =
                          Provider.of<AuthService>(context, listen: false);

                      if (!loginForm.isValidForm()) return;

                      loginForm.isLoading = true;

                      // TODO: validar si el registrer es correcto es correcto
                      final String? errorMessage = await authService.createUser(
                        // loginForm.nombre,
                        // loginForm.apellido,
                        loginForm.email,
                        loginForm.password,
                      );
                      if (errorMessage == null) {
                        Navigator.pushReplacementNamed(context, 'home');
                      } else {
                        //TODO: mostrar error en pantalla
                        print(errorMessage);
                        loginForm.isLoading = false;
                      }
                    },
            ),
          ],
        ),
      ),
    );
  }
}
