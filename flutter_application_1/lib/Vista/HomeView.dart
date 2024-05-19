
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Vista/HomePageApp.dart';
import 'package:flutter_application_1/Vista/VistaCatalogo.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          'Bienvenido',
          style: TextStyle(
            color:  Colors.white,
          
            fontWeight: FontWeight.w600,
            letterSpacing: 3,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFB12D24),
      ),
      drawer: Drawer(
        backgroundColor: Color(0xFFB12D24),
        child: ListView(
          children: [
            ListTile(
              title: Text('Catalogo',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 3,
                  )),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VistaCatalogo()),
                );
              },
            ),
          ],
        ),
      ),
      body: HomePageApp(),
    );
  }
}
