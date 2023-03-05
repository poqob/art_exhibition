enum EntrancePages { entrance0, entrance1, entrance2 }

EntrancePages entranceInstance = EntrancePages.entrance0;

extension ExtensionEntrancePages on EntrancePages {
  static List page = [
    ["assets/images/entrance0.svg", "Hello !", "misions " * 50],
    ["assets/images/entrance1.svg", "Safety", "guard " * 50],
    ["assets/images/entrance2.svg", "Enjoy !", "entartainment " * 20],
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
