import 'dart:convert';
import 'dart:io';

import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class JsonFileOperations {
  JsonFileOperations();
  JsonFileOperations._privateConstructor();
  static final JsonFileOperations _instance =
      JsonFileOperations._privateConstructor();
  static JsonFileOperations get instance => _instance;

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path\\saved.json');
  }

  //it works in every page open which has like or save button.
  Future<List<Content>> read() async {
    List<Content> readedData = <Content>[];
    try {
      var path = await _localFile;

      var json = path.readAsStringSync();
      Logger().d(json);
      Logger().d(path);
      var response = await jsonDecode(json);
      if (response.toString().isNotEmpty) {
        for (var element in response) {
          readedData.add(Content.fromJson(element));
        }
      }
    } catch (e) {}
    return readedData;
  }

  //works on dispose a page.
  Future<void> write(List<Content> list) async {
    var cntnt = list.map((content) => content.toJson()).toList();
    await _localFile.then((value) {
      value.writeAsString(
        jsonEncode(cntnt),
        mode: FileMode.writeOnly,
      );
    });
  }
}
