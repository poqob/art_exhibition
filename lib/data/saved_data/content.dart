class Content {
  //fiels
  late final String heading;
  late final List id;
  late final String imgPath;
  late final String contentText;

  Content(this.heading, this.id, this.imgPath, this.contentText);

  Content.fromJson(Map<String, dynamic> json) {
    heading = json["heading"];
    id = json["id"];
    imgPath = json["imgPath"];
    contentText = json["contentText"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> content = <String, dynamic>{};
    content['heading'] = heading;
    content['id'] = id;
    content['imgPath'] = imgPath;
    content['contentText'] = contentText;

    return content;
  }

  //equality operations

  @override
  bool operator ==(covariant Content other) => other.hashCode == hashCode;

  @override
  int get hashCode => id[0].length + id[1];
}/*
  -heading : String
   -id:  name,id; List(2,String-int, growable:false)
   -image path : String
   -content text : String
*/