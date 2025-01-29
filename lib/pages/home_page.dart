import 'package:flutter/material.dart';
import 'package:nutri_menu/pages/account_page.dart';
import 'package:nutri_menu/pages/logout_page.dart';
import 'package:nutri_menu/pages/message_page.dart';
import 'package:nutri_menu/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Índice de la página seleccionada

  // Lista de páginas que se mostrarán según el índice seleccionado
  final List<Widget> _pages = [
    HomeContent(), // Contenido de la página de inicio
    AccountPage(),
    MessagePage(),
    SettingPage(),
    LogoutPage(), // Página de cierre de sesión
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mostrarPopupBienvenida(context);
    });
  }

  void _mostrarPopupBienvenida(BuildContext context) {
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 100,
        left: MediaQuery.of(context).size.width * 0.1,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Text(
              'NutriMenú',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );

    // Inserta el popup
    Overlay.of(context).insert(overlayEntry);

    // Remueve el popup después de 3 segundos
    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenid@ a NutriMenú'),
      ),
      body: _pages[_selectedIndex], // Muestra la página seleccionada
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor:
            Colors.black, // Color oscuro para íconos seleccionados
        unselectedItemColor:
            Colors.grey[600], // Color oscuro para íconos no seleccionados
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Cuenta',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Mensajes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.logout),
            label: 'Cerrar Sesión',
          ),
        ],
      ),
    );
  }
}

// Contenido de la página de inicio
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/image01.jpg', height: 350, width: 350),
        ],
      ),
    );
  }
}
