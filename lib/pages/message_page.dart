import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Mensajes',
        style: TextStyle(fontSize: 50),
      ),
    );
  }
}
