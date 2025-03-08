using Toybox.System;
using Toybox.Sensor;

class SensorDetector {
    var registerShotDataCallback;
    var isSensorEnabled = false;

    function initialize(callbackObj) {
        registerShotDataCallback = callbackObj;
    }

    function onSensorData(sensorData as Sensor.SensorData) as Void {
        System.println("onSensorData -- onSensorData" + sensorData.accelerometerData.x);
        // System.println("RegisterShotRunningView -- accelerometerData x: " + sensorData.accelerometerData.x);
        // System.println("RegisterShotRunningView -- accelerometerData y: " + sensorData.accelerometerData.y);
        // System.println("RegisterShotRunningView -- accelerometerData z: " + sensorData.accelerometerData.z);
        // System.println("RegisterShotRunningView -- gyroscopeData x: " + sensorData.gyroscopeData.x);
        // System.println("RegisterShotRunningView -- gyroscopeData y: " + sensorData.gyroscopeData.y);
        // System.println("RegisterShotRunningView -- gyroscopeData z: " + sensorData.gyroscopeData.z);

        registerShotDataCallback.processMotion(sensorData);
    }

    function enableSensors() {
        // System.println("RegisterShotRunningView -- enableSensors ");
        if (!isSensorEnabled) {
            // Basic sensor configuration
            var options = {
                :period => 1,
                :accelerometer => {
                    :sampleRate => 1,
                    :enabled => true
                },
                :gyroscope => {
                    :sampleRate => 1,
                    :enabled => true
                }
            };

            Sensor.registerSensorDataListener(method( : onSensorData), options);
            isSensorEnabled = true;
        }
    }

    function disableSensors() {
        if (isSensorEnabled) {
            Sensor.unregisterSensorDataListener();
            isSensorEnabled = false;
        }
    }
}