import 'package:art_exhibition/data/db/models/art/model_art.dart';

abstract class ArtStates {
  const ArtStates();
}

class ArtInitial extends ArtStates {
  const ArtInitial();
}

class ArtLoading extends ArtStates {
  const ArtLoading();
}

class ArtLoaded extends ArtStates {
  final List<Art> arts;
  const ArtLoaded(this.arts);
}

class ArtError extends ArtStates {
  final String message;
  const ArtError(this.message);
}
