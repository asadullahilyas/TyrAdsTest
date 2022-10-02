import 'dart:convert';

import 'package:asadullah_tyrads_test/models/stepper_data_item.dart';
import 'package:asadullah_tyrads_test/widgets/vertical_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AsadullahTyrAdsPage(),
    );
  }
}

class AsadullahTyrAdsPage extends StatelessWidget {
  const AsadullahTyrAdsPage({Key? key}) : super(key: key);

  static MethodChannel platform =
      const MethodChannel('going.native.for.userdata');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: FutureBuilder<List<StepperDataItem>?>(
        future: getData(),
        builder: (context, snapshot) {
          final list = snapshot.data;

          if (list == null || list.isEmpty == true) {
            return const Center(
              child: SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator()),
            );
          }

          // After data is received, we need to activate the first item.
          list.first.isActive = true;

          return VerticalStepper(list: list);
        },
      ),
    )));
  }

  Future<List<StepperDataItem>?>? getData() async {
    await Future.delayed(const Duration(seconds: 2));
    final String data = await platform.invokeMethod('getData');
    final parsedData = jsonDecode(data);
    final List<StepperDataItem> list =
        List.generate(parsedData.length, (index) {
      final item = parsedData[index];
      return StepperDataItem(
          title: item['title'],
          subtitle: item['subtitle'],
          description: item['description']);
    });
    return Future.value(list);
  }
}
