
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Modelo/modeloCatalogo.dart';
import 'package:intl/intl.dart';

class VistaCatalogo extends StatefulWidget {
  _vistaCatalogo createState() => _vistaCatalogo();
}

class _vistaCatalogo extends State<VistaCatalogo> {
  final numberFormat = NumberFormat.currency(locale: 'es_MX', symbol: "\$");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogo',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 3,
            ),
        ),
        
        backgroundColor: Color(0xFFB12D24),
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
           
            color: Color.fromRGBO(241, 240, 252, 0.808),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(0, 125, 124, 128),
                blurRadius: 30,
                offset: Offset(0, 10),
              )
            ]),
        child: GridView.builder(
            itemCount: catalogo.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: int.parse("2"),
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.5),
              crossAxisSpacing: 5,
              mainAxisExtent: 250,
            ),
            itemBuilder: (context, index) {
              return Container(
                  child: Column(
                children: <Widget>[
                  Image.asset(catalogo[index].imagen),
                  Text(catalogo[index].nombre),
                  Text("\$" + catalogo[index].precio),
                  Text(catalogo[index].tiempo),
                ],
              ));
            }),
      ),
      backgroundColor: Color.fromRGBO(143, 137, 137, 0.808),
    );
  }
}

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menu'),
            decoration: BoxDecoration(
              color: Color.fromRGBO(129, 1, 5, 0.808),
            ),
          ),
          ListTile(
            title: Text('Inicio'),
            onTap: () {
              /* Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VistaCatalogo()),
              );*/
            },
          ),
        ],
      ),
    );
  }
}
