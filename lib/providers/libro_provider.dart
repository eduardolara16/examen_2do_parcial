import 'package:flutter/material.dart';
import 'package:libreria_examen/models/libro.dart';
import 'package:libreria_examen/services/api_service.dart';

class BookListProvider with ChangeNotifier {
  final BookService _bookService = BookService();
  List<Book> _books = [];

  List<Book> get books => _books;

  Future<void> fetchBooks() async {
    try {
      _books = await _bookService.getBooks();
      notifyListeners();
    } catch (error) {
      print('Error fetching books: $error');
    }
  }
}
