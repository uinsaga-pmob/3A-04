import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'kopi_model.dart';

class DbHelper {
  static final DbHelper instance = DbHelper._init();
  static Database? _database;

  DbHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('kopi_db.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  // Membuat tabel dan menyuntikkan semua menu lama kamu sekaligus
  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE menu_kopi (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      title TEXT NOT NULL,
      description TEXT NOT NULL,
      price TEXT NOT NULL,
      image TEXT NOT NULL
    )
    ''');

    //TABEL TRANSAKSI
    await db.execute('''
    CREATE TABLE transaksi (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      nama_menu TEXT,
      harga INTEGER,
      jumlah INTEGER,
      metode TEXT,
      total INTEGER,
      tanggal TEXT
    )
    ''');

    // Suntik data menu bawaan agar tidak kosong saat pertama dibuka
    final List<Map<String, String>> menuBawaan = [
      {
        'title': 'Americano',
        'description': 'Minuman kopi yang dibuat dari espresso + air panas.',
        'price': '15000',
        'image': 'assets/images/americano.jpg'
      },
      {
        'title': 'Gula Aren',
        'description': 'Kopi dengan manis alami gula aren.',
        'price': '20000',
        'image': 'assets/images/gula aren.jpg'
      },
      {
        'title': 'Kopi Latte',
        'description': 'Espresso + susu, rasa creamy dan ringan.',
        'price': '22000',
        'image': 'assets/images/latte.jpg'
      },
      {
        'title': 'Cappuccino',
        'description': 'Espresso dengan susu dan foam tebal di atasnya.',
        'price': '23000',
        'image': 'assets/images/cappucino.jpeg'
      },
      {
        'title': 'Mocha',
        'description': 'Kopi dengan campuran coklat, manis dan creamy.',
        'price': '25000',
        'image': 'assets/images/moca.jpg'
      },
      {
        'title': 'Espresso',
        'description': 'Kopi pekat dengan rasa kuat dan aroma tajam.',
        'price': '12000',
        'image': 'assets/images/espresso.jpg'
      },
      {
        'title': 'Affogato',
        'description': 'Perpaduan espresso panas dan es krim vanila dingin.',
        'price': '26000',
        'image': 'assets/images/affogato.jpeg'
      },
      {
        'title': 'Caramel',
        'description': 'Kombinasi espresso, susu hangat, dan sirup caramel.',
        'price': '27000',
        'image': 'assets/images/caramel.jpeg'
      },
      {
        'title': 'Matcha Latte',
        'description': 'Minuman matcha premium dengan susu creamy.',
        'price': '24000',
        'image': 'assets/images/Matcha Latte.jpeg'
      },
    ];

    for (var menu in menuBawaan) {
      await db.insert('menu_kopi', menu);
    }
  }

  // Fungsi untuk mengambil seluruh menu dari database
  Future<List<Kopi>> readAllKopi() async {
    final db = await instance.database;
    final result = await db.query('menu_kopi');
    return result.map((json) => Kopi.fromMap(json)).toList();
  }

  // Fungsi untuk menambahkan menu baru (dipakai di form floating button nanti)
  Future<int> insertKopi(Kopi kopi) async {
    final db = await instance.database;
    return await db.insert('menu_kopi', kopi.toMap());
  }

  // Fungsi baru untuk menghapus menu berdasarkan ID
  Future<int> deleteKopi(int id) async {
    final db = await instance.database;
    return await db.delete(
      'menu_kopi',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Fungsi baru untuk memperbarui data menu berdasarkan ID
  Future<int> updateKopi(Kopi kopi) async {
    final db = await instance.database;
    return await db.update(
      'menu_kopi',
      kopi.toMap(), // Mengonversi objek kopi kembali menjadi Map/Struktur Tabel
      where: 'id = ?',
      whereArgs: [kopi.id],
    );
  }

  //Fungsi simpan transaksi
  Future<int> insertTransaction(
    Map<String, dynamic> data,
  ) async {
    final db = await instance.database;

    return await db.insert(
      'transaksi',
      data,
    );
  }

  //Fungsiambil riwayat
  Future<List<Map<String, dynamic>>> getTransactions() async {
    final db = await instance.database;

    return await db.query(
      'transaksi',
      orderBy: 'id DESC',
    );
  }

//Fungsi hapus 1 riwayat
  Future<int> deleteTransaction(
    int id,
  ) async {
    final db = await instance.database;

    return await db.delete(
      'transaksi',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

//Fungsihapus semua riwayat
  Future<int> clearHistory() async {
    final db = await instance.database;

    return await db.delete(
      'transaksi',
    );
  }

  Future<void> tambahKeKeranjang(Map<String, dynamic> map) async {}

  Future dapatkanKeranjang() async {}

  Future<void> kurangiJumlahKeranjang(int idKopi) async {}

  Future<void> hapusDariKeranjang(int idKopi) async {}
}
