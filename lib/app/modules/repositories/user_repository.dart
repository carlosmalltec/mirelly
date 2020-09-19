import 'package:parse_server_sdk/parse_server_sdk.dart';
import 'package:sistema_de_controle/app/modules/models/user.dart';
import 'package:sistema_de_controle/app/modules/repositories/parse_errors.dart';
import 'package:sistema_de_controle/app/modules/repositories/table_keys.dart';

class UserRepository {
  Future<User> signUp(User u) async {
    final parseUser = ParseUser(u.mail, u.password, u.mail);
    parseUser.set<String>(TableKeys.userName, u.name);
    parseUser.set<String>(TableKeys.userContact, u.contact);
    parseUser.set<int>(TableKeys.userType, u.userType.index);

    final response = await parseUser.signUp();
    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<User> loginWithEmail(String email, String password) async {
    final parseUser = ParseUser(email, password, null);
    final response = await parseUser.login();
    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error.code));
    }
  }

  Future<User> currentUser() async {
    final parseUser = await ParseUser.currentUser();
    if (parseUser != null) {
      final response =
          await ParseUser.getCurrentUserFromServer(parseUser.sessionToken);
      if (response.success) {
        return mapParseToUser(response.result);
      } else {
        parseUser.logout();
      }
    }
    return null;
  }

  User mapParseToUser(ParseUser parseUser) {
    return User(
      id: parseUser.objectId,
      name: parseUser.get(TableKeys.userName),
      mail: parseUser.get(TableKeys.userMail),
      contact: parseUser.get(TableKeys.userContact),
      userType: UserType.values[parseUser.get(TableKeys.userType)],
      createdAt: parseUser.get(TableKeys.userCreatedAt),
    );
  }
}
