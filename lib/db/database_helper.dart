import 'package:databas1/models/Question1.dart';

import 'package:databas1/models/read_question.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _db;
  DatabaseHelper._internal();

  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'interview_prep.db');
    return await openDatabase(path, version: 1, onCreate: _createTables);
  }

  Future<void> _createTables(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        firstName TEXT,
        lastName TEXT,
        email TEXT UNIQUE,
        password TEXT
      )
    ''');

    await db.execute('''
         CREATE TABLE questions(
         id INTEGER PRIMARY KEY AUTOINCREMENT,
         question TEXT,
         optionA TEXT,
         optionB TEXT,
         optionC TEXT,
         optionD TEXT,
         correct TEXT
       );
    ''');

    await db.execute('''
CREATE TABLE read_questions(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  category TEXT,
  question TEXT,
  answer TEXT
)
''');
  }

  // --- USER CRUD ---
  Future<int> insertUser(Map<String, dynamic> user) async {
    final dbClient = await database;
    return await dbClient.insert('users', user);
  }

  Future<Map<String, dynamic>?> getUser(String email, String password) async {
    final dbClient = await database;
    final res = await dbClient.query(
      'users',
      where: 'email = ? AND password = ?',
      whereArgs: [email.toLowerCase(), password],
    );
    return res.isNotEmpty ? res.first : null;
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final dbClient = await database;
    final res = await dbClient.query(
      'users',
      where: 'email = ?',
      whereArgs: [email.toLowerCase()],
    );
    return res.isNotEmpty ? res.first : null;
  }

  // ---------- QUESTIONS CRUD ----------
  Future<void> insertQuestion(Map<String, dynamic> q) async {
    final dbClient = await database;
    await dbClient.insert('questions', q);
  }

  Future<List<Question>> getAllQuestions() async {
    final dbClient = await database;
    final res = await dbClient.query('questions');
    return res.map((e) => Question.fromMap(e)).toList();
  }

  Future<int> questionCount() async {
    final dbClient = await database;
    final res = await dbClient.rawQuery('SELECT COUNT(*) FROM questions');
    return Sqflite.firstIntValue(res) ?? 0;
  }

  // ---------- READ QUESTIONS CRUD ----------
  // INSERT
  Future<void> insertReadQuestion(Map<String, dynamic> q) async {
    final dbClient = await database;
    await dbClient.insert('read_questions', q);
  }

  // GET ALL
  Future<List<ReadQuestion>> getAllReadQuestions() async {
    final dbClient = await database;
    final res = await dbClient.query('read_questions');
    return res.map((e) => ReadQuestion.fromMap(e)).toList();
  }
}
