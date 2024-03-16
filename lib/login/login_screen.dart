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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
    ));
  }

  String email = '';
  String password = '';
  bool _isPasswordVisible = false; // Add this line

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (buildContext) => viewModel,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/background.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 150),
                  Text(
                    Locales.string(context, 'welcome_back'),
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: Locales.string(context, 'email'),
                              labelStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.email, color: Colors.lightBlueAccent),

                              errorBorder: OutlineInputBorder( // Remove error border to eliminate the horizontal line
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                            onChanged: (text) {
                              email = text;
                            },
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return Locales.string(context, 'please_enter_email');
                              }

                              bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                              ).hasMatch(text);
                              if (!emailValid) {
                                return Locales.string(context, 'email_format_not_valid');
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65,
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: Locales.string(context, 'password'),
                              labelStyle: TextStyle(color: Colors.black),
                              prefixIcon: Icon(Icons.lock, color: Colors.lightBlueAccent),
                              // Add the suffix icon here
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Choose the icon based on the state of _isPasswordVisible
                                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.lightBlueAccent,
                                ),
                                onPressed: () {
                                  // Update the state to toggle visibility
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            style: TextStyle(color: Colors.black),
                            obscureText: !_isPasswordVisible, // Use the state here
                            onChanged: (text) {
                              password = text;
                            },
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return Locales.string(context, 'enter_password');
                              }
                              if (text.trim().length < 6) {
                                return Locales.string(context, 'password_should_be');
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            validateForm(context);
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text(
                              Locales.string(context, 'login'),
                              style: TextStyle(fontSize: 18 ,color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                    },
                    child: Text(
                      Locales.string(context, 'dont_have_an_account'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void validateForm(BuildContext context) {
    if (formKey.currentState?.validate() == true) {
      viewModel.login(email, password, context);
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
  void login(String email, String password, BuildContext context) async {
    String? message = null;
    try {
      navigator?.showLoading(isDismissable: true);
      print('dialog shown');
      var result = await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      var userObj = await DataBaseUtils.readUser(result.user?.uid ?? "");
      if (userObj == null) {
        message =Locales.string(context, 'failed_to_complete_sign_in');
      } else {
        navigator?.gotoHome(userObj);
      }
    } on FirebaseAuthException catch (e) {
      message = Locales.string(context, 'wrong_email_password');
    } catch (e) {
      message = Locales.string(context, 'something_went_wrong');
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
