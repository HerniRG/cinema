import 'package:flutter/material.dart';
import '../data/user_shared_preferences.dart';
import '../widgets/menu/menu_movie_list.dart';
import 'login_page.dart';

// Página principal del menú
class MenuPrincipal extends StatefulWidget {
  final String username;

  const MenuPrincipal({super.key, required this.username});

  @override
  State<MenuPrincipal> createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'iconHeader',
                child: Image.asset(
                  'assets/images/iconHeader.png',
                  height: 30,
                ),
              ),
              const SizedBox(width: 10),
              Text('Bienvenido ${widget.username}',
                  style: const TextStyle(color: Colors.white)),
            ],
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.logout, color: Colors.white),
              onPressed: _logout,
            ),
          ],
          bottom: const TabBar(
            labelColor: Colors.white,
            indicatorColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            labelPadding: EdgeInsets.symmetric(horizontal: 2.0),
            tabs: [
              Tab(text: 'Populares'),
              Tab(text: 'Mejor Valoradas'),
              Tab(text: 'Próximamente'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            movieList('popular'),
            movieList('top_rated'),
            movieList('upcoming'),
          ],
        ),
      ),
    );
  }

  // Función para cerrar sesión
  Future<void> _logout() async {
    await UserNameSharedPreferences.removeUsername();
    navigateToLogin();
  }

  // Navega a la página de inicio de sesión
  navigateToLogin() {
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const LoginPage();
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 0.0);
          const end = Offset.zero;
          var tween = Tween(begin: begin, end: end);
          var offsetAnimation = animation.drive(tween);
          return SlideTransition(
            position: offsetAnimation,
            child: child,
          );
        },
      ),
      (route) => false,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${widget.username} ha cerrado sesión',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.red[900],
        showCloseIcon: true,
      ),
    );
  }
}
