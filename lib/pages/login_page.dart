import 'package:flutter/material.dart';
import 'package:nutri_menu/components/alert.dart';
import 'package:nutri_menu/pages/home_page.dart';

class LoginPage extends StatelessWidget {
  final userController = TextEditingController();
  final passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Text(
              'Inicio de Sesión',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: userController,
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: passwordController,
                obscureText: true, // Oculta la contraseña
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  border: UnderlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String email = userController.text;
                String password = passwordController.text;

                // Verifica si los campos están vacíos
                if (email.isEmpty || password.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => MyAlert(
                      titulo: 'Error',
                      message:
                          'Los campos de usuario y contraseña no pueden estar vacíos.',
                      confirmButtonText: 'OK',
                      onConfirm: () {
                        // Cierra el diálogo cuando el usuario presione "OK"
                        Navigator.of(context).pop();
                      },
                      showCancelButton: false, // No mostrar el botón Cancel
                    ),
                  );
                } else if (email == 'user' && password == 'password') {
                  // Navega a HomePage si las credenciales son correctas
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                } else {
                  // Muestra un mensaje de error si las credenciales no son válidas
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Usuario o contraseña incorrectos'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Ingresar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('¿No tienes una cuenta aún?   '),
                ElevatedButton(
                  onPressed: () {
                    // Aquí puedes agregar la navegación a la página de registro
                  },
                  child: const Text('Regístrate'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
