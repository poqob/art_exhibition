import 'package:art_exhibition/data/saved_data/content.dart';
import 'package:art_exhibition/data/saved_data/json.dart';
import 'package:art_exhibition/data/saved_data/states.dart';
import 'package:bloc/bloc.dart';

class SavedCubit extends Cubit<SavedStates> {
  SavedCubit() : super(const SavedInitial());

  Future<List<Content>> getSavedContents() async {
    //get contents.
    emit(const SavedLoading());
    List<Content> contents = await JsonFileOperations.instance.read();
    emit(SavedLoaded(contents));
    return contents;
  }

  Future<void> saveContent(List<Content> contents) async {
    emit(const SavedWriting());
    await JsonFileOperations.instance.write(contents);
    emit(const SavedWrote());
    emit(SavedLoaded(contents));
  }
}
