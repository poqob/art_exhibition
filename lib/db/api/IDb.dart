// ignore_for_file: file_names

abstract class IDb {
  Future<void> conn();
  Future<void> connKill();
  bool get isConnected;
  Future<dynamic> query(String query);
}
