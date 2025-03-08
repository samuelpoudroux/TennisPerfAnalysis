using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Timer;
using Toybox.Math;
using Toybox.System;
using Toybox.Sensor;

class RegisterShotRunningView extends WatchUi.View {
    var screenWidth;
    var screenHeight;
    var registerShotData;
    var sensorDetector;
    var resultText = "";

    function initialize() {
        View.initialize();
        registerShotData = new RegisterShotData(8, 800.0, 500, "FOREHAND", self);
        sensorDetector = new SensorDetector(registerShotData);
    }

    function onInput(event) {
        // System.println("Input detected: " + event);
        return true;  // Retourner true pour indiquer que l'événement a été géré
    }

    function setResultText(text) {
        resultText = text;
    }

    function onLayout(dc) {
        screenWidth = dc.getWidth();
        screenHeight = dc.getHeight();

        // Activer les capteurs
        sensorDetector.enableSensors();
    }

    function onShow() {
        sensorDetector.enableSensors();
    }

    function onHide() {
        sensorDetector.disableSensors();
    }

    function onUpdate(dc) {
        // if (isStopping) {
        //     System.println("Update ignoré car stop() est en cours...");
        //     return;
        // }
        dc.clear();
        ScreenUtils.clearScreenDefault(dc, Graphics.COLOR_WHITE);

        // Titre
        ScreenUtils.drawTextAt(dc, screenWidth / 2, screenHeight / 6, "Analyse", Graphics.FONT_XTINY,
                               Graphics.COLOR_BLACK, Graphics.TEXT_JUSTIFY_CENTER);

        // Affichage du résultat
        ScreenUtils.drawTextAt(dc, screenWidth / 2, screenHeight * 3 / 4, resultText, Graphics.FONT_XTINY,
                               Graphics.COLOR_BLACK, Graphics.TEXT_JUSTIFY_CENTER);
    }

    function stop() {
        registerShotData.onMotionEnd();
    }

    function toto() {
        System.println("Test" + registerShotData.getShotDataFromStorage("FOREHAND"));
    }
}
