import 'package:art_exhibition/db/models/artist/model_artist.dart';

abstract class ArtistStates {
  const ArtistStates();
}

class ArtistInitial extends ArtistStates {
  const ArtistInitial();
}

class ArtistLoading extends ArtistStates {
  const ArtistLoading();
}

class ArtistLoaded extends ArtistStates {
  final List<Artist> artists;
  const ArtistLoaded(this.artists);
}

class ArtistError extends ArtistStates {
  final String message;
  const ArtistError(this.message);
}
