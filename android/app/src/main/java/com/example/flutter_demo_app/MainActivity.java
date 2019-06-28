package com.example.flutter_demo_app;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    //channel的名称，由于app中可能会有多个channel，这个名称需要在app内是唯一的。
    private static final String BATTERY_CHANNEL = "tina.flutter.io/battery";
    private static final String CHARGING_CHANNEL = "tina.flutter.io/charging";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        MethodChannel methodChannel = new MethodChannel(getFlutterView(), BATTERY_CHANNEL);
        EventChannel eventChannel = new EventChannel(getFlutterView(), CHARGING_CHANNEL);
        // 直接 new MethodChannel，然后设置一个Callback来处理Flutter端调用
        methodChannel.setMethodCallHandler((methodCall, result) -> {
            // 在这个回调里处理从Flutter来的调用
            if (methodCall.method.equals("getBatteryLevel")) {

                nativeCallFlutter();

                int batteryLevel = getBatteryLevel();
                if (-1 != batteryLevel) {
                    result.success(batteryLevel);
                } else {
                    result.error("UNAVAILABLE", "Battery level not available.", null);
                }
            } else {
                result.notImplemented();
            }
        });

        eventChannel.setStreamHandler(new EventChannel.StreamHandler() {
            private BroadcastReceiver chargingStateChangeReceiver;

            @Override
            public void onListen(Object o, EventChannel.EventSink eventSink) {
                chargingStateChangeReceiver = createChargingStateChangeReceiver(eventSink);
                registerReceiver(chargingStateChangeReceiver, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            }

            @Override
            public void onCancel(Object o) {
                unregisterReceiver(chargingStateChangeReceiver);
                chargingStateChangeReceiver = null;
            }
        });
    }

    private void nativeCallFlutter() {
        new MethodChannel(getFlutterView(), BATTERY_CHANNEL)
                .invokeMethod("getName", null, new MethodChannel.Result() {
                    @Override
                    public void success(Object o) {
                        Log.i("debug", "success result: " + o.toString());
                    }

                    @Override
                    public void error(String s, String s1, Object o) {

                    }

                    @Override
                    public void notImplemented() {

                    }
                });
    }

    private int getBatteryLevel() {
        int batteryLevel = -1;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            BatteryManager batteryManager = (BatteryManager) getSystemService(BATTERY_SERVICE);
            batteryLevel = batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY);
        } else {
            Intent intent = new ContextWrapper(getApplicationContext()).
                    registerReceiver(null, new IntentFilter(Intent.ACTION_BATTERY_CHANGED));
            batteryLevel = (intent.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) /
                    intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1);
        }

        return batteryLevel;
    }


    private BroadcastReceiver createChargingStateChangeReceiver(final EventChannel.EventSink events) {
        return new BroadcastReceiver() {
            @Override
            public void onReceive(Context context, Intent intent) {
                int status = intent.getIntExtra(BatteryManager.EXTRA_STATUS, -1);
                if (status == BatteryManager.BATTERY_STATUS_UNKNOWN) {
                    events.error("UNAVAILABLE", "Charging status unavailable", null);
                } else {
                    boolean isCharging = status == BatteryManager.BATTERY_STATUS_CHARGING ||
                            status == BatteryManager.BATTERY_STATUS_FULL;
                    // 把电池状态发给Flutter
                    events.success(isCharging ? "charging" : "discharging");
                }
            }
        };
    }
}
