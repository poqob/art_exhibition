import 'package:art_exhibition/db/api/db.dart';
import 'package:art_exhibition/db/api/queries.dart';
import 'package:art_exhibition/db/bloc/art/states_art.dart';
import 'package:art_exhibition/db/models/art/model_art.dart';
import 'package:bloc/bloc.dart';

class ArtCubit extends Cubit<ArtStates> {
  ArtCubit() : super(const ArtInitial());

  Future<void> getArt(Que que) async {
    try {
      emit(const ArtLoading());

      List<Art> arts = <Art>[];

      await Db().query(que.getQue).then((value) {
        for (var element in value) {
          arts.add(Art.fromList(element));
        }
      });

      emit(ArtLoaded(arts));
    } catch (e) {
      emit(ArtError(e.toString()));
    }
  }
}
