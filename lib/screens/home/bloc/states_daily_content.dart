import 'package:art_exhibition/data/db/models/art/model_art.dart';

abstract class DailyContentStates {
  const DailyContentStates();
}

class DailyInitial extends DailyContentStates {
  const DailyInitial();
}

class DailyLoading extends DailyContentStates {
  const DailyLoading();
}

class DailyLoaded extends DailyContentStates {
  final List<Art> contents;
  const DailyLoaded(this.contents);
}

class DailyError extends DailyContentStates {
  final String message;
  const DailyError(this.message);
}
