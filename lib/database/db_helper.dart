import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();
    return _database!;
  }

  static Future<Database> initDB() async {
    String path = join(
      await getDatabasesPath(),
      'kopi.db',
    );

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {

        // TABEL MENU
        await db.execute('''
        CREATE TABLE menu(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nama TEXT,
          deskripsi TEXT,
          harga INTEGER,
          gambar TEXT
        )
        ''');

        // TABEL TRANSAKSI
        await db.execute('''
        CREATE TABLE transaksi(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          nama_menu TEXT,
          harga INTEGER,
          jumlah INTEGER,
          metode TEXT,
          total INTEGER,
          tanggal TEXT
        )
        ''');
      },
    );
  }

  // =========================
  // TRANSAKSI
  // =========================

  static Future<int> insertTransaction(
      Map<String, dynamic> data) async {

    final db = await database;

    return await db.insert(
      'transaksi',
      data,
    );
  }

  static Future<List<Map<String, dynamic>>>
      getTransactions() async {

    final db = await database;

    return await db.query(
      'transaksi',
      orderBy: 'id DESC',
    );
  }

  static Future<int> deleteTransaction(
      int id) async {

    final db = await database;

    return await db.delete(
      'transaksi',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  static Future<int> clearHistory() async {

    final db = await database;

    return await db.delete('transaksi');
  }
}