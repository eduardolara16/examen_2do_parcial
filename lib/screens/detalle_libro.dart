import 'package:flutter/material.dart';
import 'package:libreria_examen/models/libro.dart';

class BookDetailScreen extends StatelessWidget {
  final Book book;
  BookDetailScreen({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Title: ${book.title}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 137, 183, 221)), // Cambia el color aquí
            ),
            Text(
              'ID: ${book.id}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 131, 165, 227)), // Cambia el color aquí
            ),
            const Text(
              'Description: ',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 131, 126, 209)), // Cambia el color aquí
            ),
            Text(
              '${book.description}',
              style: TextStyle(
              fontSize: 16,
                color: Color.fromARGB(255, 198, 117, 191), // Cambia el color aquí
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Villains:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple), // Cambia el color aquí
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: book.villains
                  .map((villain) => Text(villain['name'] ?? 'Unknown'))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
