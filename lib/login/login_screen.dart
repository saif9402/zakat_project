import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../database_utils.dart';
import '../provider/base.dart';
import '../home/home_screen.dart';
import '../provider/my_user.dart';
import '../provider/user_provider.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'Login';
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends BaseState<LoginScreen, LoginViewModel>
    implements LoginNavigator {
  @override
  LoginViewModel initViewModel() => LoginViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;

    // Make the navigation bar transparent
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // Set navigation bar color to transparent
      statusBarColor: Colors.transparent, // Set status bar color to transparent
    ));
  }

  String email = '';
  String password = '';
  var formKey = GlobalKey<FormState>();

  // Define the gold color
  final Color BlueColor = Color.fromARGB(255, 59, 129, 214);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (buildContext) => viewModel,
      child: Stack(
        children: [
          Container(color: Colors.white),
          Scaffold(
            backgroundColor: Colors.transparent,

            body: SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/background1.png'), // Replace with your actual image file name and path
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.all(12),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: Locales.string(context, 'email'),
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onChanged: (text) {
                          email = text;
                        },
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter Email';
                          }

                          bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return 'Email format not valid';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: Locales.string(context, 'password'),
                          labelStyle: TextStyle(color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        obscureText: true,
                        onChanged: (text) {
                          password = text;
                        },
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return 'Please enter password';
                          }
                          if (text.trim().length < 6) {
                            return 'Password should be at least 6 chars';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          validateForm();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                          shape:
                          MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ),
                        child: Text(
                          Locales.string(context, 'login'),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RegisterScreen.routeName);
                        },
                        child: Text(
                          Locales.string(context, 'dont_have_an_account'),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void validateForm() {
    if (formKey.currentState?.validate() == true) {
      viewModel.login(email, password);
    }
  }

  @override
  void gotoHome(MyUser user) {
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.user = user;

    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }
}

class LoginViewModel extends BaseViewModel<LoginNavigator> {
  var firebaseAuth = FirebaseAuth.instance;
  void login(String email, String password) async {
    String? message = null;
    try {
      navigator?.showLoading(isDismissable: true);
      print('dialog shown');
      var result = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      // read user from Database
      var userObj = await DataBaseUtils.readUser(result.user?.uid ?? "");
      if (userObj == null) {
        message = 'Failed to complete Sign in , please try register again';
      } else {
        // goto home
        navigator?.gotoHome(userObj);
      }
    } on FirebaseAuthException catch (e) {
      message = 'Wrong Email or password';
    } catch (e) {
      message = 'something went wrong';
    }
    navigator?.hideDialog();
    if (message != null) {
      navigator?.showMessage(message);
    }
  }
}

abstract class LoginNavigator implements BaseNavigator {
  void gotoHome(MyUser user);
}
