import 'package:flutter/material.dart';

class ZakatElfitrPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height, // Set the height to match screen height
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background1.jpg'), // Replace with your image path
                fit: BoxFit.cover,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1), // Add padding to the top (10% of screen height)
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Zakat Elfitr',
                      style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.05, color: Colors.white), // Set font size as 5% of screen height
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Set the space as 2% of screen height
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20), // Add padding to the container
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.68, // Adjust the width here (65% of screen width)
                        child: Text(
                          'Zakat al-Fitr is a kind of charity (sadaqah)'
                              ' that is obligatory at the time of breaking the fast of Ramadan'
                              ' when the sun sets on the last day of Ramadan'
                              'the amount of zakat elfitr atleast is: '
                              '2.75 kg of any food for human consumption for each one such as:'
                              ' dates, wheat, rice or other kinds of food that humans eat',
                          style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025, color: Colors.white), // Set font size as 2.5% of screen height
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
