import 'package:floor/floor.dart';
import '../models/Book.dart';

@dao
abstract class BookDao {
  @Query('SELECT * FROM Book')
  Future<List<Book>> findAllBooks();

  @insert
  Future<int> insertBook(Book book);

  @delete
  Future<int> deleteBook(Book book);
}
