import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  Future<void> _launchURL() async {
    const url =
        'https://docs.google.com/forms/d/e/1FAIpQLSdJVdi6q5lxDmbG2P8tEHLb_KP2EzgGgSeMTnhY1PVfdcYRTw/viewform?usp=sf_FormPage';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Eco Form',
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green.shade600,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Form.png', // Replace 'your_image.png' with your image path
              height: 200, // Adjust height as needed
              width: 200, // Adjust width as needed
            ),
            SizedBox(height: 10), // Adding some space between image and text
            Text(
              'Welcome to the Eco Form!', // Your welcome message
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10), // Adding some space between text and button
            Text(
              'Pick-up services available: 9 am -7 pm', // Your instruction message
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Please fill out the form below:', // Your instruction message
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10), // Adding some space between text and button
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
              ),
              onPressed: _launchURL,
              child: Text(
                'Open Form',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
