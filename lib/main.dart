import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recuperar el valor d''un camp de text',
      theme: ThemeData(       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      
      home: MyCustomForm(),
    );
  }
}


class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});
  @override
  State<MyCustomForm> createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recuperar el valor d\'un camp de text'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: myController,
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(//se trata de un modalbottomsheet
            backgroundColor: Colors.transparent,//esto hace que el fondo sea transparente
            context: context,//este es el contexto de la aplicación
            builder: (BuildContext context) {
              return Container(
                decoration: const BoxDecoration(//esta parte permite hacer diferentes decoraciones como el color y los bordes del contenedor
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                height: 200,//esta es la altura del bottonsheet
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [//aqui estan los diferentes elementos que estan dentro del container
                      const Text('Modal Bottom Sheet'),// este es el titulo del modal
                      ElevatedButton(//este boton no permitira cerrar el container.
                        onPressed: () => Navigator.of(context).pop(), 
                        child: const Text('close bottomsheet'),
                        )
                    ],
                  ),
                ),
              );
            },
          );  

          // showDialog(context: context, 
          //   barrierDismissible: true, //te permite cerrar el diálogo al tocar fuera de él
          //   builder: (BuildContext context){
          //     return SimpleDialog( //se trata de un simpledialog
          //       title: const Text('Hola'), //este es el titulo del dialogo
          //       children: [ 
          //         SimpleDialogOption(
          //           onPressed: () {
          //             Navigator.of(context).pop(); //esta parte cierra el dálogo
          //           },
          //           child: const Text('opcion 1'), // esto es la opción que esta dentro del diálogo
          //         ),
          //       ],
          //     );
          //   },          
          // );

          // showDialog(context: context,
          //   barrierDismissible: true, //esta parte te permite cerrar el diálogo al tocar fuera de él
          //   builder: (BuildContext context){
          //     return AlertDialog(
          //       title: const Text('Warning'), //este es el título del diálogo
          //       content: const Text('peligro: no pulses el boton'), //este es el contenido del diálogo
          //       actions: [
          //         ElevatedButton( //al pulsar este boton cerrara el dialogo
          //           onPressed: () {
          //             Navigator.of(context).pop();
          //           },
          //           child: const Text('OK'), //esto es el texto del boton
          //         ),
          //       ],
          //     );
          //   },          
          // );   
                     
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('this is a SnackBar'), //esto es el contenido del snackbar
          //     duration: Duration(seconds: 4), //esto es la duración del snackbar
          //   ),
          // );

        },
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
