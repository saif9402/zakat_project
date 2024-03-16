import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import '../database_utils.dart';
import '../provider/base.dart';
import '../home/home_screen.dart';
import '../login/login_screen.dart';
import '../provider/firebase_errors.dart';
import '../provider/my_user.dart';
import '../provider/user_provider.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseState<RegisterScreen,RegisterViewModel>
    implements RegisterNavigator{
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String userName = '';

  @override
  void initState() {
    super.initState();
    // don't forget
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Scaffold(
        backgroundColor: Colors.black, // Match background color with login screen
        body: SingleChildScrollView(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 230),
                Text(
                  Locales.string(context, 'hi'),
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
                            labelText: Locales.string(context, 'first_name'), // Update label text
                            labelStyle: TextStyle(color: Colors.black), // Match label text color with login screen
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
                          style: TextStyle(color: Colors.black), // Match text color with login screen
                          onChanged: (text) {
                            firstName = text;
                          },
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return Locales.string(context, 'enter_first_name');
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
                            labelText: Locales.string(context, 'last_name'), // Update label text
                            labelStyle: TextStyle(color: Colors.black), // Match label text color with login screen
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
                          style: TextStyle(color: Colors.black), // Match text color with login screen
                          onChanged: (text) {
                            lastName = text;
                          },
                          validator: (text) {
                            if (text == null || text.trim().isEmpty) {
                              return Locales.string(context, 'enter_last_name');
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
                            labelText: Locales.string(context, 'email'),
                            labelStyle: TextStyle(color: Colors.black),
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
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          style: TextStyle(color: Colors.black),
                          obscureText: true,
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
                          validateForm();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue), // Match button color with login screen
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            Locales.string(context, 'create_account'), // Update button text
                            style: TextStyle(fontSize: 18, color: Colors.white), // Match button text color with login screen
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                  },
                  child: Text(
                    Locales.string(context, 'already_have_an_account'), // Update text
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black, // Match text color with login screen
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
    );
  }

  void validateForm() {
    if (formKey.currentState?.validate() == true) {
      // create Account
      viewModel.register(email, password,firstName,lastName,userName, context);
    }
  }

  @override
  RegisterViewModel initViewModel() {
    return RegisterViewModel();
  }

  @override
  void gotoHome(MyUser user) {
    hideDialog();
    var userProvider = Provider.of<UserProvider>(context,listen: false);
    userProvider.user = user;
    Navigator.of(context)
        .pushReplacementNamed(HomeScreen.routeName);
  }
}

// provider
class RegisterViewModel extends BaseViewModel<RegisterNavigator> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void register(String email, String password, String firstName,
      String lastName, String userName, BuildContext context) async {
    String? message;
    try {
      navigator?.showLoading();
      var result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      var user = MyUser(
          id: result.user?.uid ?? "",
          fName: firstName,
          lName: lastName,
          userName: userName = "",
          email: email);
      var task = await DataBaseUtils.createDBUser(user);
      navigator?.gotoHome(user);
      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.weakPassword) {
        message = Locales.string(context, 'weak_password');
      } else if (e.code == FirebaseErrors.email_in_use) {
        message = Locales.string(context, 'account_already_exist');
      } else {
        message = Locales.string(context, 'wrong_email_password');
      }
    } catch (e) {
      message = e.toString();
    }
    navigator?.hideDialog();
    if (message != null) {
      navigator?.showMessage(message);
    }
  }
}

abstract class RegisterNavigator extends BaseNavigator {
  void gotoHome(MyUser myUser);
}
