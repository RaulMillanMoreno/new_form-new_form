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
          showModalBottomSheet(
            backgroundColor: Colors.transparent,
            context: context,
            builder: (BuildContext context) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text('Modal Bottom Sheet'),
                      ElevatedButton(
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
          //   barrierDismissible: true, 
          //   builder: (BuildContext context){
          //     return SimpleDialog(
          //       title: const Text('Hola'),
          //       children: [
          //         SimpleDialogOption(
          //           onPressed: () {
          //             Navigator.of(context).pop();
          //           },
          //           child: const Text('opcion 1'),
          //         ),
          //       ],
          //     );
          //   },          
          // );

          // showDialog(context: context,
          //   barrierDismissible: true, 
          //   builder: (BuildContext context){
          //     return AlertDialog(
          //       title: const Text('Warning'),
          //       content: const Text('peligro: no pulses el boton'),
          //       actions: [
          //         ElevatedButton(
          //           onPressed: () {
          //             Navigator.of(context).pop();
          //           },
          //           child: const Text('OK'),
          //         ),
          //       ],
          //     );
          //   },          
          // );   
                     
          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(
          //     content: Text('this is a SnackBar'),
          //     duration: Duration(seconds: 4),            
          //   ),
          // );

        },
        child: const Icon(Icons.text_fields),
      ),
    );
  }
}
