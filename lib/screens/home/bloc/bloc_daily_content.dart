import 'package:art_exhibition/db/api/db.dart';
import 'package:art_exhibition/db/api/queries.dart';
import 'package:art_exhibition/db/models/art/model_art.dart';
import 'package:art_exhibition/screens/home/bloc/states_daily_content.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyContentCubit extends Cubit<DailyContentStates> {
  DailyContentCubit() : super(const DailyInitial());
  //methods here

  Future<void> getContents() async {
    try {
      emit(const DailyLoading());

      List<Art> contents = <Art>[];

      //query and get items from db

      for (var i = 0; i < 3; i++) {
        await Db().query(Que.values[i].getQue).then(
          (value) {
            if (value != null) {
              for (var element in value) {
                contents.add(
                  Art.fromList(element),
                );
              }
            }
          },
        );
      }

      emit(DailyLoaded(contents));
    } catch (e) {
      emit(DailyError(e.toString()));
    }
  }
}
