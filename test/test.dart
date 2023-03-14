import 'dart:convert';
import 'dart:io';

import 'package:art_exhibition/data/saved_data/content.dart';

void main() async {
  File file = File('D:\\Dosyalar\\Flutter\\art_exhibition\\test\\test.json');
  //Saved.instance.contents.clear();
  //Saved.instance.add(c);
  //Saved.instance.add(a);
  //print(Saved.instance.contents.length);
  //Saved.getInstance.remove(c);
  //print(Saved.instance.contents.length);
  //print(Saved.instance.contents.first.heading);
  // Saved.instance.contents.map((e) => e.toJson()).toList();
  //file.writeAsString(jsonEncode(Saved.instance.contents),
  //   mode: FileMode.writeOnly);

  List readedDate = [];
  await file.readAsString().then((value) {
    var response = jsonDecode(value);
    for (var element in response) {
      readedDate.add(Content.fromJson(element));
    }
  });
}
