import 'package:art_exhibition/data/db/api/IDb.dart';
import 'package:art_exhibition/data/db/api/postgresql.dart';

class Db implements IDb {
  //fields
  late final IDb db;

  //Constructor
  //Singleton architecture with factory.
  static final Db _singleton = Db._interval();
  Db._interval() {
    db = PostgreSQL();
  }
  factory Db() {
    return _singleton;
  }

  //connection commands
  @override
  Future<void> conn() async {
    await db.conn();
  }

  //close connection
  @override
  Future<void> connKill() async => await db.connKill();

  // dynamic query
  @override
  Future<dynamic> query(String query) async {
    return await db.query(query).then((value) => value);
  }

  @override
  bool get isConnected => db.isConnected;
}






  //var d1 = Db();
  //var d2 = Db();
  //print(identical(d1, d2)); output: true
  //Singleton architecture with Static field with getter.
  /*
  //definition
  Db._privateConstructor();
  static final Db _instance = Db_privateConstructor();
  static Db get instance => _instance;
  
  //usage
  Db db=Db.instance
   */
