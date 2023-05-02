import 'dart:async';
import 'package:flutter/material.dart';
import 'package:humanize_date_task/relativeTimeExtension.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Humanize date task'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectedDate = DateTime.now();
  String humanDateString = 'Today';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      DateTime pickedDate = DateTime(picked.year, picked.month, picked.day);
      setState(() {
        selectedDate = picked;
        humanDateString = pickedDate.relativeTime();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _selectDate(context),
              child: const Text('Select date'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
                'Time ago according to outlook depending on picked date'),
            Text(
              humanDateString,
              style: const TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text('Picked Date'),
            Text("${selectedDate.toLocal()}".split(' ')[0]),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
