import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Mostrar la alerta de bienvenida cuando la página se carga
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mostrarAlertaBienvenida(context);
    });
  }

  void _mostrarAlertaBienvenida(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible:
          false, // Evita que el usuario cierre la alerta tocando fuera
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('¡Bienvenido!'),
          content: Text('Gracias por usar NutriMenú.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cierra la alerta
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido a NutriMenú'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/image01.jpg', height: 350, width: 350),
          ],
        ),
      ),
    );
  }
}
