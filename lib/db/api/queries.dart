enum Que with mi {
  allPaints,
  allStatues,
  allDecorative,
  allArchitecture,
  allArtists,
  allMuseums
}

extension ExtensionQueries on Que {
  String get getQue => _fun(name);
}

mixin mi {
  String _fun(String name) {
    const String artQueryRoot =
        "select art_id,art_name,art_artist_id,art_material_id,art_movement_id,art_about_id,artist_name,material_name,movement_name,about_text,about_img from";
    switch (name) {
      case "allArtists":
        return "select * from artists.allArtists();";
      case "allMuseums":
        return "select * from museums.allMuseums();";
      default:
        return "$artQueryRoot arts.$name();";
    }
  }
}
