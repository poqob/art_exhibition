import 'package:art_exhibition/utilities/save_content/content.dart';
import 'package:art_exhibition/utilities/save_content/json.dart';
import 'package:art_exhibition/utilities/todo.dart';

//add and remove operations will be used more than once.
//So, to choose correct data structure i consider this.
@Todo('''
ofcourse there are lots of data structures but i'll apply 
DoublyLinkedArrayList data structure later updates.
nowly i'll go on with generic list.
''')
class Saved extends JsonFileOperations {
  //singleton constructor
  Saved._privateConstructor() {
    super.read();
  }
  static final Saved _instance = Saved._privateConstructor();
  static Saved get instance => _instance;

  //fields
  List<Content> contents = [];

  //methods
  void add(Content content) {
    if (contents.contains(content)) return;
    contents.add(content);
  }

  void remove(Content content) {
    if (!contents.contains(content)) return;
    contents.remove(content);
  }

  void saveToFile() {
    super.write();
  }
}
