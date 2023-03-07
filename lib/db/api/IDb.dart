import 'package:postgres/postgres.dart';

abstract class IDb {
  Future<void> conn();
  Future<void> connKill();
  bool get isConnected;
  Future<PostgreSQLResult> query(String query);
}
