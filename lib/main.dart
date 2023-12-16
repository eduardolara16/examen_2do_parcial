import 'package:flutter/material.dart';
import 'package:libreria_examen/providers/libro_provider.dart';
import 'package:provider/provider.dart';
import 'package:libreria_examen/screens/lista_libro.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BookListProvider()),
      ],
      child: MaterialApp(
        title: 'Stephen King Library',
        theme: ThemeData(
          primarySwatch: Colors.teal,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Probando'),
          ),
          body:
              bookListScreen(), 
        ),
      ),
    );
  }
}
