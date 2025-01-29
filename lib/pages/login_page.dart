import 'package:flutter/material.dart';
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
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
