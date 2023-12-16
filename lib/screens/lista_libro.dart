import 'package:flutter/material.dart';
import 'package:libreria_examen/screens/detalle_libro.dart';
import 'package:provider/provider.dart';
import 'package:libreria_examen/providers/libro_provider.dart';

class bookListScreen extends StatefulWidget {
  @override
  _BookListScreenState createState() => _BookListScreenState();
}

class _BookListScreenState extends State<bookListScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<BookListProvider>(context, listen: false).fetchBook());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Wrap your widget with a Scaffold
      appBar: AppBar(
        title: Text('Book List'),
      ),
      body: Consumer<BookListProvider>(
        builder: (context, bookListProvider, child) {
          if (bookListProvider.books.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: bookListProvider.books.length,
            itemBuilder: (context, index) {
              final book = bookListProvider.books[index];
              return ListTile(
                title: Text(book.title),
                subtitle: Text(book.description),
                onTap: () {
                  // Implement navigation to book details
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => bookDetailScreen(book: book)));
                },
              );
            },
          );
        },
      ),
    );
  }
}
