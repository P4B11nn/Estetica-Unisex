import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePageApp extends StatelessWidget {
  HomePageApp({super.key});
  final nombreController = TextEditingController();
  
  final fechaController = TextEditingController();
  final horaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[

          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Próximas citas',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color(0xffB4584B)),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('citas')
                    .orderBy('Hora', descending: false)
                    .snapshots(),
                
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Algo salió mal");
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> data = snapshot.data!.docs[index]
                          .data() as Map<String, dynamic>;
                      return ListTile(
                        title: Text('Cita con ${data['Nombre']}'),
                        subtitle: Text(
                            'Fecha: ${data['Fecha']} Hora: ${data['Hora']}'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize
                              .min, // Esto hace que la fila tenga el tamaño mínimo necesario para sus hijos
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                           
                                nombreController.text = data['Nombre'];
                                fechaController.text = data['Fecha'];
                                horaController.text = data['Hora'];
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Editar Cita'),
                                      content:
                                          const Text('¿Deseas editar la cita?'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('No'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Sí'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return AlertDialog(
                                                  title: Text('Editar Cita'),
                                                  content: SingleChildScrollView(
                                                    child: Column(
                                                    children: <Widget>[
                                                      TextField(
                                                        controller:
                                                            nombreController,
                                                        decoration:
                                                            const InputDecoration(
                                                                labelText:
                                                                    'Nombre'),
                                                      ),
                                                      TextField(
                                                        controller:
                                                            fechaController,

                                                        decoration:
                                                            const InputDecoration(
                                                                labelText:
                                                                    'Fecha'
                                                                    ),

                                                      ),
                                                      TextField(
                                                        controller:
                                                            horaController,
                                                        decoration:
                                                            const InputDecoration(
                                                                labelText:
                                                                    'Hora'),
                                                      ),
                                                    ],
                                                  ),
                                                  ),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      child: const Text(
                                                          'Cancelar'),
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                    TextButton(
                                                      child:
                                                          const Text('Guardar'),
                                                      onPressed: () {
                                                        FirebaseFirestore.instance
                                                            .collection('citas')
                                                            .doc(snapshot.data!.docs[index].id)
                                                            .update({
                                                          'Nombre': nombreController.text,
                                                          'Fecha': fechaController.text,
                                                          'Hora': horaController.text,
                                                        });
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                // Tu código para eliminar la cita
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text('Eliminar Cita'),
                                      content:
                                          const Text('¿Deseas eliminar la cita? Recuerda consultarlo con el cliente'),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('No'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: const Text('Sí'),
                                          onPressed: () {
                                            FirebaseFirestore.instance
                                                .collection('citas')
                                                .doc(snapshot.data!.docs[index].id)
                                                .delete();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}