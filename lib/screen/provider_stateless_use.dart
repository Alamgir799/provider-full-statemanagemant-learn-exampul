// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider_statemanagement/screen/Login_api_provider.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({Key? key}) : super(key: key);
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> _toogle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("provider learning"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
                valueListenable: _toogle,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: _toogle.value,
                    decoration: InputDecoration(
                      hintText: "password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            _toogle.value = !_toogle.value;
                          },
                          icon: Icon(_toogle.value
                              ? Icons.visibility_off
                              : Icons.visibility)),
                    ),
                  );
                }),
            SizedBox(
              height: 100,
            ),
            Center(
              child: ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: (context, value, child) {
                    return Text(
                      _counter.value.toString(),
                      style: TextStyle(fontSize: 50),
                    );
                  }),
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (_) => LoginApiScreen())),
                child: Text("Next")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
