import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import '../choosing/choosing.dart';
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

class _RegisterScreenState extends BaseState<RegisterScreen, RegisterViewModel>
    implements RegisterNavigator {
  GlobalKey<FormState> formKey = GlobalKey<FormState>(); // Assigning formKey to Form widget

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String userName = '';

  final Color customColor = Color.fromARGB(255, 59, 129, 214); // Custom color

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  InputDecoration customInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      labelStyle: TextStyle(color: customColor),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: customColor),
        borderRadius: BorderRadius.circular(10), // Added border radius
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: customColor),
        borderRadius: BorderRadius.circular(10), // Added border radius
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Builder(builder: (_) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/background1.jpg', // Replace with your background image path
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Form( // Assigning formKey to Form widget
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40.0),
                    TextFormField(
                      decoration: customInputDecoration(
                          Locales.string(context, 'first_name')),
                      style: TextStyle(
                          color: Colors.black),
                      onChanged: (text) {
                        firstName = text;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: customInputDecoration(
                          Locales.string(context, 'last_name')),
                      style: TextStyle(
                          color: Colors.black),
                      onChanged: (text) {
                        lastName = text;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: customInputDecoration(
                          Locales.string(context, 'user_name')),
                      style: TextStyle(
                          color: Colors.black),
                      onChanged: (text) {
                        userName = text;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: customInputDecoration(
                          Locales.string(context, 'email')),
                      style: TextStyle(
                          color: Colors.black),
                      onChanged: (text) {
                        email = text;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: customInputDecoration(
                          Locales.string(context, 'password')),
                      style: TextStyle(color: Colors.black),
                      obscureText: true,
                      onChanged: (text) {
                        password = text;
                      },
                    ),
                    SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: validateForm,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          Locales.string(context, 'create_account'),
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(customColor),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10), // Added border radius
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, LoginScreen.routeName);
                      },
                      child: Text(
                        Locales.string(context, 'already_have_an_account'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: customColor, fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  void validateForm() {
    if (formKey.currentState?.validate() == true) {
      viewModel.register(email, password, firstName, lastName, userName);
    }
  }

  @override
  RegisterViewModel initViewModel() {
    return RegisterViewModel();
  }

  @override
  void gotoHome(MyUser user) {
    hideDialog();
    var userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.user = user;
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }
}

// provider
class RegisterViewModel extends BaseViewModel<RegisterNavigator> {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  void register(String email, String password, String firstName,
      String lastName, String userName) async {
    String? message;
    try {
      navigator?.showLoading();
      var result = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      var user = MyUser(
          id: result.user?.uid ?? "",
          fName: firstName,
          lName: lastName,
          userName: userName,
          email: email);
      var task = await DataBaseUtils.createDBUser(user);
      navigator?.gotoHome(user);
      return;
    } on FirebaseAuthException catch (e) {
      if (e.code == FirebaseErrors.weakPassword) {
        message = 'The password provided is too weak.';
      } else if (e.code == FirebaseErrors.email_in_use) {
        message = 'The account already exists for that email';
      } else {
        message = 'Wrong username or password';
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
