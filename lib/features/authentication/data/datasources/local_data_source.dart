import 'package:dev_test/features/authentication/data/models/login_resp_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

abstract class LocalDataSource {
  Future<void> storeData(UserContext userContext);
}

@LazySingleton(as: LocalDataSource)
@injectable
class LocalDataSourceImpl implements LocalDataSource {
  static late Database db;
  static Future<void> initDatabase() async {
    db = await openDatabase(
      'user_context_db',
      version: 1,
      onCreate: (db, version) {
        db.execute(
            'CREATE TABLE usercontext (id INTEGER PRIMARY KEY,lang TEXT,tz TEXT, uid INTEGER)');
      },
    );
  }

  @override
  Future<void> storeData(UserContext userContext) async {
    await db.rawInsert('INSERT INTO usercontext (lang,tz,uid) VALUES(?,?,?)',
        [userContext.lang, userContext.tz, userContext.uid]);
    getData();
  }

  Future<void> getData() async {
    final data = await db.rawQuery('SELECT * FROM usercontext');
    print(data);
  }
}
