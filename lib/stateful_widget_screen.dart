// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider_statemanagement/screen/count_exmaple.dart';

class StateFulScreen extends StatefulWidget {
  const StateFulScreen({Key? key}) : super(key: key);

  @override
  State<StateFulScreen> createState() => _StateFulScreenState();
}

class _StateFulScreenState extends State<StateFulScreen> {
  int count = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      count++;
      print(count);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    print("build" + count.toString());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("provider learning"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              DateTime.now().hour.toString() +
                  ':' +
                  DateTime.now().minute.toString()+
                  ':' +
                  DateTime.now().second.toString(),
              style: TextStyle(fontSize: 50),
            ),
          ),
          Text(DateTime.now().toString()),
          Center(
            child: Text(
              count.toString(),
              style: TextStyle(fontSize: 50),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (_) => CountExample())),
              child: Text("Next")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count++;
            print(count);
            setState(() {});
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
