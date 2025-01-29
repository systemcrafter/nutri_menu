import 'package:flutter/material.dart';

class MyAlert extends StatelessWidget {
  final String message;
  final String titulo;
  final String confirmButtonText;
  final String cancelButtonText;
  final VoidCallback onConfirm;

  const MyAlert({
    super.key,
    required this.message,
    required this.titulo,
    required this.onConfirm,
    this.confirmButtonText = 'OK',
    this.cancelButtonText = 'Cancel',
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(titulo),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text(cancelButtonText),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Cierra el diálogo
                onConfirm(); // Llama a la función personalizada
              },
              child: Text(confirmButtonText),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}
