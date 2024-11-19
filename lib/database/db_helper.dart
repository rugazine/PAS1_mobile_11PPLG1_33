import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Team {
  final String idTeam;
  final String strTeam;
  final String strTeamBadge;

  Team({
    required this.idTeam,
    required this.strTeam,
    required this.strTeamBadge,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      idTeam: json['idTeam'],
      strTeam: json['strTeam'],
      strTeamBadge: json['strTeamBadge'],
    );
  }
}

class DbHelper {
  static Database? _database;
  static final DbHelper db = DbHelper._();

  DbHelper._();
  factory DbHelper() => db;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'team_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute('''
          CREATE TABLE favorite_teams(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            teamId TEXT,
            teamName TEXT,
            teamBadge TEXT
          )
        ''');
      },
    );
  }

  Future<void> insertFavoriteTeam(Map<String, dynamic> team) async {
    final Database db = await database;
    await db.insert('favorite_teams', team);
  }

  Future<List<Map<String, dynamic>>> getFavoriteTeams() async {
    final Database db = await database;
    return await db.query('favorite_teams');
  }

  Future<void> deleteFavoriteTeam(String teamId) async {
    final Database db = await database;
    await db.delete(
      'favorite_teams',
      where: 'teamId = ?',
      whereArgs: [teamId],
    );
  }
}
