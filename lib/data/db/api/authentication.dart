import 'package:art_exhibition/data/db/api/db.dart';

class Authentication {
  // making Authentication singleton.
  Authentication._privateConstructor();
  static final Authentication _instance = Authentication._privateConstructor();
  static Authentication get instance => _instance;

  //fields for login situation
  String? _username;
  String? _password;
  bool? _authState = false;

  //methods
  Future<bool> logIn(String username, String password) async {
    dynamic res;
    await Db().query("select users.auth('$username','$password');").then(
      (value) {
        res = value[0][0];

        try {
          if (res == true) {
            _username = username;
            _password = password;
            _authState = true;
          }
        } catch (e) {
          throw Exception(
              "database query result's runtime type is not boolean. runtimetype: ${res.runtimeType}");
        }
      },
    );
    return res;
  }

  //weak method!
  Future<void> signUp(
      String username, String password, int countryId, int cityId) async {
    await Db()
        .query(
            "select users.signUpFromForm('$username','$password','$countryId','$cityId');")
        .then(
      (value) {
        _username = username;
        _password = password;
      },
    );
  }
}

// getters
extension ExceptionAuth on Authentication {
  String? get getUsername => _authState == true ? _username : null;
  String? get getPassword => _authState == true ? _password : null;
  bool? get getAuthState => _authState;
}
