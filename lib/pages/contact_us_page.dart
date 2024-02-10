import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.lightGreen,
                borderRadius: BorderRadius.circular(20.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20.0),
                  Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Welcome to our website! Green Circuit is more than just an e-waste disposal company.\n\n'
                    'We are a team of environmental specialists dedicated to safe and sustainable electronics recycling.\n\n'
                    'Our state-of-the-art facilities and certified processes ensure maximum resource recovery and the utmost protection for our planet. Trust Green Circuit for reliable, compliant e-waste solutions.',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'If Assistance Needed',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text('Email: info@yourwebsite.com'),
                  Text('Phone: +1 (234) 567-890'),
                  Text('Phone: +1 (234) 567-890'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
