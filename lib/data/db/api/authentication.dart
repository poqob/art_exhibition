/// Authentication is a singleton authentication class, it offers some methods to authenticate
/// and methods for authenticated user.
/// postgresql functions already created, you can see sql statements in data/db/models directory.
/// logIn() : queries if the user exists in db.
/// signUp() : controlls and creates new user in db.
/// getUserName : returns username if the user authenticated.
/// getAuthState :  returns state of authenticate.
/// getPassword : returns password if the user authenticated.
import 'package:art_exhibition/data/db/api/db.dart';
import 'package:art_exhibition/data/db/api/postgresql.dart';

class Authentication {
  // making Authentication singleton.
  Authentication._privateConstructor();
  static final Authentication _instance = Authentication._privateConstructor();
  static Authentication get instance => _instance;

  //fields for login situation
  String? _username;
  String? _password;
  bool? _authState = false;

  // login method
  Future<bool> logIn(String username, String password) async {
    dynamic res;
    String que;

    if (Db().db.runtimeType == PostgreSQL().runtimeType) {
      que = "select users.auth('$username','$password');";
    } else {
      que = "select users.auth('$username','$password');";
    }
    await Db().query(que).then(
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

  //sign up method
  Future<void> signUp(
      String username, String password, int countryId, int cityId) async {
    String que;
    if (Db is PostgreSQL) {
      que =
          "select users.signUpFromForm('$username','$password','$countryId','$cityId');";
    } else {
      que = "";
    }

    await Db().query(que).then(
      (value) {
        _username = username;
        _password = password;
      },
    );
  }
}

// extensions for Authentication, getters
extension ExtensionAuth on Authentication {
  String? get getUsername => _authState == true ? _username : null;
  String? get getPassword => _authState == true ? _password : null;
  bool? get getAuthState => _authState;
}
