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
        backgroundColor: Color.fromRGBO(0, 200, 0, 40),
        title: Text('Form Page'),
      ),
      body: Center(
        child: ElevatedButton(
          style: ButtonStyle(iconColor: MaterialStatePropertyAll(Colors.green)),
          onPressed: _launchURL,
          child: Text(
            'Open Form',
            style: TextStyle(color: Color.fromRGBO(0, 200, 0, 40)),
          ),
        ),
      ),
    );
  }
}
