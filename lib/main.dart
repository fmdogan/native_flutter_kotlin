import 'package:flutter/material.dart';
import 'package:native_test/native_services/battery_service.dart';
import 'package:native_test/native_services/downloads_service.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
              onPressed: () => BatteryService.getBatteryLevel().then((value) {
                _counter = value;
                setState(() {});
              }),
              child: const Text("get battery level"),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => DownloadService.downloadsDirectory.then((value) {
                debugPrint(value?.path);
              }),
              child: const Text("get download directory"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BatteryService.getBatteryLevel().then((value) {
            print(value);
            _counter = value;
            setState(() {});
          });

          BatteryService.testArguments().then(print);
        },
        tooltip: 'native test',
        child: const Icon(Icons.battery_charging_full_rounded),
      ),
    );
  }
}
