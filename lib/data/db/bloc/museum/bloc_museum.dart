// ignore_for_file: depend_on_referenced_packages

import 'package:art_exhibition/data/db/api/db.dart';
import 'package:art_exhibition/data/db/api/queries.dart';
import 'package:art_exhibition/data/db/bloc/museum/states_museum.dart';
import 'package:art_exhibition/data/db/models/museum/model_museum.dart';
import 'package:bloc/bloc.dart';

//methods are written here according to MuseumStates.

class MuseumCubits extends Cubit<MuseumStates> {
  MuseumCubits() : super(const MuseumInitial());

  Future<void> getMuseums() async {
    try {
      emit(const MuseumLoading());

      //museums that will be listed here.
      List<Museum> museums = <Museum>[];

      await Db().query(Que.allMuseums.getQue).then((value) {
        for (var element in value) {
          museums.add(Museum.fromList(element));
        }
      });

      emit(MuseumLoaded(museums));
    } catch (e) {
      emit(MuseumsError(e.toString()));
    }
  }
}
