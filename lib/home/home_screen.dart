import 'package:flutter/material.dart';
import 'package:my_zakat/business_logic/knowledge_base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_zakat/provider/my_user.dart';
import 'package:provider/provider.dart';
import '../provider/base.dart';
import '../provider/user_provider.dart';
import '../login/login_screen.dart';
import '../api/api.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';
  var Zakat_Total = 0;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseState<HomeScreen, HomeViewModel>
    implements HomeNavigator {
  final Color blueColor = Color.fromARGB(172, 107, 184, 251);
  final Color buttonColor = Color.fromARGB(255, 22, 92, 177);

  @override
  HomeViewModel initViewModel() => HomeViewModel();

  @override
  void initState() {
    super.initState();
    viewModel.navigator = this;
    // UserProvider user = UserProvider();
    // user.initMyUser();
  }

  @override
  Widget build(BuildContext context) {
    MyUser? currentUser =
        Provider.of<UserProvider>(context, listen: false).user;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Zakaty',
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/images/background.jpg'), // Replace with your actual image file name and path
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Welcome Card
                Card(
                  margin: EdgeInsets.only(top: 190.0),
                  elevation: 1,
                  color: blueColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back!',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Arial'),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Mr. ${currentUser?.fName} ${currentUser?.lName}',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Total : ${currentUser?.total_zakat.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16),

                // Featured Content Card
                Card(
                  elevation: 1,
                  color: blueColor,
                  child: InkWell(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          title: Text(
                            'Zakat details',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text('Check out the latest updates'),
                          textColor: Colors.black,
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Text(
                            "What is Zakat?",
                            style: TextStyle(
                                fontSize:
                                    24.0, // Adjust the font size as needed
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Zakat is an Islamic practice of giving a portion of ones wealth to those in need.\n It is considered a mandatory act of worship and one of the Five Pillars of Islam.\n The term Zakat is derived from the Arabic word that means to purify or to cleanse.",
                            style: TextStyle(
                                fontSize:
                                    16.0, // Adjust the font size as needed
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Calculation of Zakat:",
                            style: TextStyle(
                                fontSize:
                                    24.0, // Adjust the font size as needed
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Zakat is typically calculated as 2.5% of a Muslim's accumulated wealth over a specific period.\n This includes savings, investments, gold, silver, and other assets.\n The purpose of Zakat is to redistribute wealth and ensure that the basic needs of the less fortunate are met.",
                            style: TextStyle(
                                fontSize:
                                    16.0, // Adjust the font size as needed
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "Distribution of Zakat:",
                            style: TextStyle(
                                fontSize:
                                    24.0, // Adjust the font size as needed
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Zakat is distributed among specific categories of recipients, as outlined in Islamic teachings.\n These categories include the poor, the needy, those in debt,\n those working to collect and distribute Zakat, and others in specific circumstances.",
                            style: TextStyle(
                                fontSize:
                                    16.0, // Adjust the font size as needed
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "2.5 Percent Rule:",
                            style: TextStyle(
                                fontSize:
                                    24.0, // Adjust the font size as needed
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "The 2.5% rule signifies that a Muslim is required to give 2.5% of their accumulated wealth annually as Zakat.\n This helps maintain social justice and equality within the Muslim community.",
                            style: TextStyle(
                                fontSize:
                                    16.0, // Adjust the font size as needed
                                fontWeight: FontWeight.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to the desired screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PricesDisplayPage()),
                    );
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        buttonColor), // Set the background color
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Set the text color
                  ),
                  child: Text(
                    'Calculate Zakat',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeViewModel extends BaseViewModel<HomeNavigator> {}

abstract class HomeNavigator extends BaseNavigator {}
