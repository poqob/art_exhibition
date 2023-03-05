import 'package:art_exhibition/db/api/db.dart';
import 'package:art_exhibition/db/api/queries.dart';
import 'package:art_exhibition/db/bloc/artists/states_artist.dart';
import 'package:art_exhibition/db/models/artist/model_artist.dart';
import 'package:bloc/bloc.dart';

class ArtistCubit extends Cubit<ArtistStates> {
  ArtistCubit() : super(const ArtistInitial());

  Future<void> getArtist() async {
    try {
      emit(const ArtistLoading());
      List<Artist> artists = <Artist>[];

      await Db().query(Que.allArtists.getQue).then((value) {
        for (var element in value) {
          artists.add(Artist.fromList(element));
        }
      });

      emit(ArtistLoaded(artists));
    } catch (e) {
      emit(ArtistError(e.toString()));
    }
  }
}
