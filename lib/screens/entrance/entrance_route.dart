import 'package:art_exhibition/constants/constants.dart';

enum EntrancePages { entrance0, entrance1, entrance2 }

EntrancePages entranceInstance = EntrancePages.entrance0;

extension ExtensionEntrancePages on EntrancePages {
  static List page = [
    [Constants.entrance0SVG, "Hello !", "misions " * 50],
    [Constants.entrance1SVG, "Safety", "guard " * 50],
    [Constants.entrance2SVG, "Enjoy !", "entartainment " * 20],
  ];
  Entrance get pageContent => Entrance.fromList(page[index]);
}

abstract class Page {
  final String imagePath;
  final String heading;
  final String content;
  Page(this.imagePath, this.heading, this.content);
}

class Entrance extends Page {
  Entrance.fromList(List page) : super(page[0], page[1], page[2]);
}
