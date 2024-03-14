import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_zakat/provider/my_user.dart';
import 'package:provider/provider.dart';
import '../choosing/choosing.dart';
import '../provider/base.dart';
import '../provider/user_provider.dart';
import '../login/login_screen.dart';
import '../zakat elfitr/zakat elfitr.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  final Color buttonColor = Color.fromARGB(255, 22, 92, 177);

  @override
  HomeViewModel initViewModel() => HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    MyUser? currentUser =
        Provider.of<UserProvider>(context, listen: false).user;

    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0, // Remove app bar shadow
        title: Text(
          '',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              UserProvider userProvider = UserProvider();
              userProvider.user = null;
              userProvider.notifyListeners();
              // Close the current screen
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false,
              );
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background1.jpg'), // Replace with your actual image file name and path
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.2, // 5% of screen width padding horizontally
                vertical: screenHeight * 0.35, // 5% of screen height padding vertically
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Welcome Card
                  Card(
                    elevation: 1,
                    child: Padding(
                      padding: EdgeInsets.all(screenWidth * 0.03), // 3% of screen width padding
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Locales.string(context, 'welcome_back'),
                            style: TextStyle(
                                fontSize: screenWidth * 0.06, // 6% of screen width font size
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Arial'),
                          ),
                          SizedBox(height: screenHeight * 0.01), // 1% of screen height space
                          Text(
                            '${Locales.string(context, 'mr')} ${currentUser?.fName} ${currentUser?.lName}',
                            style: TextStyle(fontSize: screenWidth * 0.04), // 4% of screen width font size
                          ),
                          SizedBox(height: screenHeight * 0.01), // 1% of screen height space
                          Text(
                            '${Locales.string(context, 'total')}: ${currentUser?.total_zakat.toStringAsFixed(2)}',
                            style: TextStyle(fontSize: screenWidth * 0.04), // 4% of screen width font size
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Featured Content Buttons
                  SizedBox(height: screenHeight * 0.04), // 4% of screen height space
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.05), // Shift buttons to the left by 5% of screen width
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Navigate to the desired screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ZakatCalculationMethodScreen()),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.lightBlueAccent), // Set the background color
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.white), // Set the text color
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                                screenWidth * 0.04), // 4% of screen width padding
                            child: Text(
                              Locales.string(context, 'calculate_zakat'),
                              style: TextStyle(
                                fontSize: screenWidth *
                                    0.04, // 4% of screen width font size
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.02), // Add 2% of screen height space between buttons
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ZakatElfitrPage()),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Colors.lightBlueAccent), // Set the background color
                            foregroundColor: MaterialStateProperty.all<Color>(
                                Colors.white), // Set the text color
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(
                                screenWidth * 0.04), // 4% of screen width padding
                            child: Text(
                              'Zakat Elfitr',
                              style: TextStyle(
                                fontSize: screenWidth *
                                    0.04, // 4% of screen width font size
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeViewModel extends BaseViewModel<HomeNavigator> {}

abstract class HomeNavigator extends BaseNavigator {}
