import 'package:art_exhibition/db/api/IDb.dart';
import 'package:postgres/postgres.dart';

class PostgreSQL implements IDb {
  late final PostgreSQLConnection connection;

  PostgreSQL() {
    connection = PostgreSQLConnection("localhost", 5432, "postgres",
        username: "postgres", password: "12345");
  }

  @override
  Future<void> conn() async => await connection.open();

  @override
  Future<void> connKill() async => await connection.close();

  @override
  Future<PostgreSQLResult> query(String query) {
    return connection.query(query).then((value) => value);
  }

  @override
  bool get isConnected => !connection.isClosed;
}
