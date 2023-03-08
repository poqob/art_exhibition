import 'package:art_exhibition/constants/constant_svg.dart';

enum EntrancePages { entrance0, entrance1, entrance2 }

EntrancePages entranceInstance = EntrancePages.entrance0;
bool isLastPage = false;

extension ExtensionEntrancePages on EntrancePages {
  static List page = [
    [ConstantSVG.entrance0.getAdressOfSVG, "Hello !", "misions " * 50],
    [ConstantSVG.entrance1.getAdressOfSVG, "Safety", "guard " * 50],
    [ConstantSVG.entrance2.getAdressOfSVG, "Enjoy !", "entartainment " * 20],
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
