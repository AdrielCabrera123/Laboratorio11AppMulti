import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AlertApp());
}

class AlertApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AlertPage(),
    );
  }
}

class AlertPage extends StatelessWidget {
  void _showMaterialAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Material Alert'),
          content: Text('This is a Material alert.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showMaterialAlertWithOptions(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Material Alert with Options'),
          content: Text('This is a Material alert with options.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showCupertinoAlert(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Cupertino Alert'),
          content: Text('This is a Cupertino alert.'),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showCupertinoAlertWithOptions(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text('Cupertino Alert with Options'),
          content: Text('This is a Cupertino alert with options.'),
          actions: <Widget>[
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cupertino and Material Alerts'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _showMaterialAlert(context),
              child: Text('Show Material Alert'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showMaterialAlertWithOptions(context),
              child: Text('Show Material Alert with Options'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => _showCupertinoAlert(context),
              child: Text('Show Cupertino Alert'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () => _showCupertinoAlertWithOptions(context),
              child: Text('Show Cupertino Alert with Options'),
            ),
          ],
        ),
      ),
    );
  }
}
