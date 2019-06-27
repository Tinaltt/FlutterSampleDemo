import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChannelDemo extends StatefulWidget {
  @override
  _ChannelDemoState createState() => _ChannelDemoState();
}

class _ChannelDemoState extends State<ChannelDemo> {
  static const methodChannel = const MethodChannel('tina.flutter.io/battery');
  static const eventChannel = const EventChannel('tina.flutter.io/charging');
  static const getBatteryMethod = "getBatteryLevel";
  String _batteryLevel = 'Unknown battery level.';
  String _chargingStatus = 'Battery status: unknown.';

  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await methodChannel.invokeMethod(getBatteryMethod);
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  Future<dynamic> platformHandler(MethodCall call) async {
    print("platformHandler call ${call.method}");
    switch (call.method) {
      case "getName":
        return "Hello from Flutter!";
        break;
    }
  }

  void _onError(Object error) {
    setState(() {
      _chargingStatus = 'Battery status: unknown.';
    });
  }

  void _onEvent(Object event) {
    setState(() {
      _chargingStatus =
          "Battery status: ${event == 'charging' ? '' : 'dis'}charging.";
    });
  }

  _setPlatformHandler() {
    print("set platformHandler");
    methodChannel.setMethodCallHandler(platformHandler);
  }

  @override
  void initState() {
    super.initState();
    _setPlatformHandler();
    eventChannel.receiveBroadcastStream().listen(_onEvent, onError: _onError);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Channel Demo"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_batteryLevel, key: const Key('Battery level label')),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RaisedButton(
                    child: const Text('Refresh'),
                    onPressed: _getBatteryLevel,
                  ),
                ),
              ],
            ),
          ),
          Text(_chargingStatus),
        ],
      ),
    );
  }
}
