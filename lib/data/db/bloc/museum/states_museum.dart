import 'package:art_exhibition/data/db/models/museum/model_museum.dart';

abstract class MuseumStates {
  const MuseumStates();
}

class MuseumInitial extends MuseumStates {
  const MuseumInitial();
}

class MuseumLoading extends MuseumStates {
  const MuseumLoading();
}

class MuseumLoaded extends MuseumStates {
  final List<Museum> museums;
  const MuseumLoaded(this.museums);
}

class MuseumsError extends MuseumStates {
  final String message;

  const MuseumsError(this.message);
}
