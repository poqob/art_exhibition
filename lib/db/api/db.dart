import 'package:postgres/postgres.dart';

class Db {
  //fields
  late final PostgreSQLConnection connection;

  //Constructor
  //Singleton architecture with factory.
  static final Db _singleton = Db._interval();
  Db._interval();
  factory Db() {
    return _singleton;
  }

  //connection commands
  Future<void> conn() async {
    connection = PostgreSQLConnection("localhost", 5432, "postgres",
        username: "postgres", password: "12345");
    await connection.open();
  }

  //close connection
  Future<void> connKill() async => await connection.close();

  // dynamic query
  Future<PostgreSQLResult> query(String query) async {
    return connection.query(query).then((value) => value);
  }
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
