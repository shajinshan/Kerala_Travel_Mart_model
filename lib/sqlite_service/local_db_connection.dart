// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class DatabaseService {
//   static Database? _db;

//   static final DatabaseService instance = DatabaseService._constructor();
//   DatabaseService._constructor();

// //get Database
//   Future<Database> get database async {
//     _db ??= await getDatabase();
//     return _db!;
//   }

//   //initialize database
//   Future<Database> getDatabase() async {
//     final databaseDirPath = await getDatabasesPath();
//     final databasePath = join(databaseDirPath, "treavelmart-localdb.db");

//     final data = await openDatabase(
//       databasePath,
//       version: 1,
//       onCreate: (db, version) async {
//         await db.execute('''
// write queryy here
// ''');
//       },
//     );
//     return data;
//   }
// }
