import 'dart:convert';
import 'dart:io';

import 'package:art_exhibition/utilities/save_content/content.dart';
import 'package:art_exhibition/utilities/save_content/saved.dart';
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
    return File('$path/saved.json');
  }

  //it works in every page open which has like or save button.
  void read() async {
    List readedDate = [];

    await _localFile.then((value) {
      value.readAsString().then((val) {
        var response = jsonDecode(val);
        for (var element in response) {
          readedDate.add(Content.fromJson(element));
        }
        Saved.instance.contents.clear();
        Saved.instance.contents.insertAll(0, readedDate as Iterable<Content>);
      });
    });
  }

  //works on dispose a page.
  void write() async {
    Saved.instance.contents.map((content) => content.toJson()).toList();
    await _localFile.then((value) {
      value.writeAsString(
        jsonEncode(Saved.instance.contents),
        mode: FileMode.writeOnly,
      );
    });
  }
}
