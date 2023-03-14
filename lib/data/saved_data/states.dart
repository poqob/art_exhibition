import 'package:art_exhibition/data/saved_data/content.dart';

abstract class SavedStates {
  const SavedStates();
}

class SavedInitial extends SavedStates {
  const SavedInitial();
}

class SavedLoading extends SavedStates {
  const SavedLoading();
}

class SavedLoaded extends SavedStates {
  final List<Content> content;
  const SavedLoaded(this.content);
}

class SavedWriting extends SavedStates {
  const SavedWriting();
}

class SavedWrote extends SavedStates {
  const SavedWrote();
}

class SavedError extends SavedStates {
  final String message;
  const SavedError(this.message);
}
