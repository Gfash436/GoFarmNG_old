import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:gofarmng/Constants/url.dart';
import 'package:gofarmng/Provider/AuthProvider/dbProvider.dart';
import 'package:gofarmng/Screens/Authentication/verification.dart';
import 'package:gofarmng/Screens/buyer_home_screen/home_screen.dart';
import 'package:gofarmng/Utilities/routers.dart';

import 'package:http/http.dart' as http;

import '../../Screens/Authentication/loginPage.dart';

class AuthenticationProvider extends ChangeNotifier {
  //Base Url
  final requestBaseUrl = ApiUrl.baseUrl;

  // Setter
  bool _isLoading = false;
  String _resMessage = '';

  //Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;

  //An null function to Register User
  void signupUser(
      {required String firstName,
      required String lastName,
      required String phoneNumber,
      required String email,
      required String password,
      required String confirmPassword,
      required String role,
      BuildContext? context}) async {
    _isLoading = false;
    notifyListeners();

    //Initialize Url
    String url = "$requestBaseUrl/api/register";

    //Create the payload(body) that the API needs
    final body = {
      "firstname": firstName,
      "lastname": lastName,
      "phoneNumber": phoneNumber,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "role": role
    };
    print(body);

    Map<String, String> requestHeaders = {
      "Content-type": "application/json",
      "Accept": "/",
    };

    //Rap request in try&catch because errors from the internet
    try {
      http.Response request = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      if (request.statusCode == 201) {
        final response = json.decode(request.body);
        print(response);
        _isLoading = false;
        _resMessage = "Verfication link is sent to your email";
        notifyListeners();

        Navigator.push(context!,
            CupertinoPageRoute(builder: (context) => const Verification()));
        //save user data and move to Login
        final userId = response['_id'];
        DatabaseProvider().saveUserId(userId);

        final registerToken = response['emailToken'];
        DatabaseProvider().saveEmailToken(registerToken);
      } else {
        final response = json.decode(request.body);

        _resMessage = response['message'];

        print(response);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = 'Internet connection is not available';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = 'Please try again';
      notifyListeners();
      print(e.toString());
    }
  }

  // A null function to Login Users
  void LoginUser(
      {required String email,
      required String password,
      BuildContext? context}) async {
    _isLoading = false;
    notifyListeners();

    //Initialize Url
    String url = "$requestBaseUrl/api/login";

    //Create the payload(body) that the API needs
    final body = {"email": email, "password": password};
    print(body);

    Map<String, String> requestHeaders = {
      "Content-type": "application/json",
      "Accept": "/",
    };

    //Rap request in try&catch because errors from the internet
    try {
      http.Response request = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      if (request.statusCode == 200) {
        final response = json.decode(request.body);
        print(response);
        _isLoading = false;
        _resMessage = "Login success";
        notifyListeners();

        //Save user data and then navigate to homepage
        final authToken = response['access_token'];
        DatabaseProvider().saveToken(authToken);
        PageNavigator(ctx: context).nextPageOnly(page: const HomeScreen());
      } else {
        final response = json.decode(request.body);
        _resMessage = response['message'];
        print(response);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = 'Internet connection is not available !';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = 'Please try again';
      notifyListeners();
      print(":::(e)");
    }
  }

  void clear() {
    _resMessage = "";
    notifyListeners();
  }

  // A null function to send user email for reset password
  void resetPassword(
      {required String email, required BuildContext context}) async {
    _isLoading = false;
    notifyListeners();

    //Initialize Url
    String url = "$requestBaseUrl/api/forgotpassword";

    //Create the payload(body) that the API needs
    final body = {"email": email};
    print(body);

    Map<String, String> requestHeaders = {
      "Content-type": "application/json",
      "Accept": "/",
    };

    //Rap request in try&catch because errors from the internet
    try {
      http.Response request = await http.post(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      if (request.statusCode == 201) {
        final response = json.decode(request.body);
        print(response);
        _isLoading = false;
        notifyListeners();

        PageNavigator(ctx: context).nextPageOnly(page: const LoginPage());
      } else {
        final response = json.decode(request.body);
        _resMessage = response['message'];
        print(response);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = 'Internet connection is not available !';
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = 'Please try again';
      notifyListeners();
      print(":::(e)");
    }
  }
}
