import 'package:amazon_clone_app/constants/error_handlig.dart';
import 'package:amazon_clone_app/constants/global_variables.dart';
import 'package:amazon_clone_app/constants/utils.dart';
import 'package:amazon_clone_app/models/user.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class AuthService {
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          address: '',
          id: '',
          email: email,
          name: name,
          password: password,
          token: '',
          type: '');

      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
        response: res,
        context: context,
        onSucces: () {
          showSnackBar(
              context, 'Account created! Login with the same creditentals');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
