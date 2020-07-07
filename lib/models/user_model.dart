import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import '../endpoints/user_api.dart';
import 'user.dart';

class UserModel extends Model {

  Map<String, dynamic> userData = Map();

  User currentUser;
  bool isLoading = false;
  UserApi userApi = UserApi();

  static UserModel of(BuildContext context) =>
      ScopedModel.of<UserModel>(context);


  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
  }

  void signIn({
    @required String email,
    @required String password,
    @required VoidCallback onSuccess,
    @required VoidCallback onFail
  }) async {

    isLoading = true;
    notifyListeners();

    userApi.login(email, password)
      .then((user) {
        currentUser = user;
        onSuccess();
        isLoading = false;
        notifyListeners();

      }).catchError((e) {
        onFail();
        isLoading = false;
        notifyListeners();
      });
  }

  void signOut() async {
    UserApi.token = null;
    userData = Map();
    currentUser = null;

    notifyListeners();
  }

  bool isLoggedIn() {
    return currentUser != null;
  }
}
