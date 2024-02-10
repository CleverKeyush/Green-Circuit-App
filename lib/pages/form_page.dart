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
          textAlign: TextAlign.center, // Center align the text
        ),
        backgroundColor: Colors.green.shade600,
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Colors.green), // Set button color
          ),
          onPressed: _launchURL,
          child: Text(
            'Open Form',
            style: TextStyle(color: Colors.white), // Set text color
          ),
        ),
      ),
    );
  }
}
