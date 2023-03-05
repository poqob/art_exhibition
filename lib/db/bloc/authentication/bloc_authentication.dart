import 'package:art_exhibition/db/api/authentication.dart';
import 'package:art_exhibition/db/bloc/authentication/states_authentication.dart';
import 'package:bloc/bloc.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(const AuthenticationInitial());

  //log in
  Future<void> auth({
    required String username,
    required String password,
  }) async {
    try {
      emit(AuthenticationAuthing());
      await Authentication.instance.logIn(username, password);
      emit(AuthenticationAuth());
    } catch (e) {
      AuthenticationError error = state as AuthenticationError;
      throw Exception(error.message);
    }
  }

  //sign up and log in(auth)
  Future<void> signUp({
    required String username,
    required String password,
    required int countryId,
    required int cityId,
  }) async {
    try {
      await Authentication.instance
          .signUp(username, password, countryId, cityId);
      await auth(username: username, password: password);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
