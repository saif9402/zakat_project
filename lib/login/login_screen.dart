import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import '../choosing/choosing.dart';
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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginViewModel>(
      create: (buildContext) => viewModel,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SizedBox(
          height: MediaQuery.of(context).size.height, // Set height to screen height
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/background.png', // Replace with your background image path
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              height: MediaQuery.of(context).size.height, // Set height to screen height
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
                      color: Colors.black, // Set text color to white
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65, // Set width to 80% of the screen width
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: Locales.string(context, 'email'),
                              labelStyle: TextStyle(color: Colors.black), // Set label text color to white
                              prefixIcon: Icon(Icons.email, color: Colors.lightBlueAccent),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            style: TextStyle(color: Colors.black), // Set text color to white
                            onChanged: (text) {
                              email = text;
                            },
                            validator: (text) {
                              if (text == null || text.trim().isEmpty) {
                                return 'Please enter Email';
                              }

                              bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                              ).hasMatch(text);
                              if (!emailValid) {
                                return 'Email format not valid';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.65, // Set width to 80% of the screen width
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: Locales.string(context, 'password'),
                              labelStyle: TextStyle(color: Colors.black), // Set label text color to white
                              prefixIcon: Icon(Icons.lock, color: Colors.lightBlueAccent),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            style: TextStyle(color: Colors.black), // Set text color to white
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
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            validateForm();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
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
        email: email,
        password: password,
      );
      // read user from Database
      var userObj = await DataBaseUtils.readUser(result.user?.uid ?? "");
      if (userObj == null) {
        message = 'Failed to complete Sign in, please try registering again';
      } else {
        // goto home
        navigator?.gotoHome(userObj);
      }
    } on FirebaseAuthException catch (e) {
      message = 'Wrong Email or password';
    } catch (e) {
      message = 'Something went wrong';
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
