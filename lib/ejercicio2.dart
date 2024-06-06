import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() {
  runApp(const CombinedApp());
}

class CombinedApp extends StatelessWidget {
  // ignore: use_super_parameters
  const CombinedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Combined Widgets',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CombinedWidgetsExample(),
    );
  }
}

class CombinedWidgetsExample extends StatefulWidget {
  // ignore: use_super_parameters
  const CombinedWidgetsExample({Key? key}) : super(key: key);

  @override
  State<CombinedWidgetsExample> createState() => _CombinedWidgetsExampleState();
}

class _CombinedWidgetsExampleState extends State<CombinedWidgetsExample> {
  DateTime _selectedDate = DateTime.now();
  bool _cupertinoSwitchValue = true;
  bool _materialSwitchValue = true;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _showCupertinoDatePicker(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: _selectedDate,
            minimumDate: DateTime(1900),
            maximumDate: DateTime(2100),
            onDateTimeChanged: (DateTime newDate) {
              setState(() {
                _selectedDate = newDate;
              });
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Combined Widgets'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Material Date Picker'),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              onPressed: () => _showCupertinoDatePicker(context),
              child: const Text('Cupertino Date Picker'),
            ),
            const SizedBox(height: 20),
            CupertinoSwitch(
              value: _cupertinoSwitchValue,
              activeColor: CupertinoColors.activeBlue,
              onChanged: (bool value) {
                setState(() {
                  _cupertinoSwitchValue = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Text(
              'Cupertino Switch is ${_cupertinoSwitchValue ? 'ON' : 'OFF'}',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            Switch(
              value: _materialSwitchValue,
              onChanged: (bool value) {
                setState(() {
                  _materialSwitchValue = value;
                });
              },
            ),
            const SizedBox(height: 10),
            Text(
              'Material Switch is ${_materialSwitchValue ? 'ON' : 'OFF'}',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}