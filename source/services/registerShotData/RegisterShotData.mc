using Toybox.System;
using Toybox.Application.Storage;
using Toybox.WatchUi;

class RegisterShotData extends WatchUi.View {
    var thresholdAccel = 8;     // m/s² - seuil pour détecter le début du mouvement
    var thresholdGyro = 800.0;  // deg/s - seuil pour la rotation du poignet
    var motionTimeout = 500;    // ms - temps sans mouvement significatif pour considérer la fin du geste
    var lastSignificantMotion = 0;
    var accelerometerReadings = [];
    var gyroscopeReadings = [];
    var timestamp = [];
    var isRecording = false;
    var startTime = null;
    var endTime = null;
    var referenceData = null;
    var shotType = null;
    var view = null;

    function initialize(thresholdAccel, thresholdGyro, motionTimeout, shotType, view) {
        self.thresholdAccel = thresholdAccel;
        self.thresholdGyro = thresholdGyro;
        self.motionTimeout = motionTimeout;
        self.shotType = shotType;
        self.view = view;
        clearData();
    }

    function clearData() {
        accelerometerReadings = [];
        gyroscopeReadings = [];
        timestamp = [];
        isRecording = false;
        startTime = null;
        endTime = null;
    }

    function startRecording() {
        System.println("registerShotData -- startRecording ");
        clearData();
        isRecording = true;
        startTime = System.getTimer();
    }

    function stopRecording() {
        System.println("registerShotData -- stopRecording ");
        if (isRecording) {
            isRecording = false;
            endTime = System.getTimer();
        }
    }

    function onMotionStart() {
        System.println("RegisterShotRunningView -- onMotionStart");
        view.setResultText("Mouvement détecté");
        WatchUi.requestUpdate();
    }

    function onMotionEnd() {
        System.println("RegisterShotRunningView -- onMotionEnd");
        // Callback appelé quand le détecteur identifie la fin d'un coup droit
        var duration = getDuration();
        view.setResultText("Durée: " + duration.format("%.2f") + "s");

        saveSwing();

        // Analyser et comparer avec la référence
        var similarity = compareWithReference();
        // Sauvegarder les données si nécessaire
        System.println("RegisterShotRunningView -- similarity+ similarity");

        WatchUi.requestUpdate();
        System.println("forehandAnimation -- finished");
    }

    function addSensorData(accelData, gyroData) {
        if (isRecording) {
            // System.println("addSensorData -- isRecording ");
            accelerometerReadings.add(accelData);
            gyroscopeReadings.add(gyroData);
            timestamp.add(System.getTimer() - startTime);
        }
    }

    function getDuration() {
        if (startTime != null && endTime != null) {
            return (endTime - startTime) / 1000.0;  // en secondes
        }
        return 0;
    }

    function setShotDataToStorage(shotType, values) {
        Storage.setValue(shotType, values);
    }

    function getShotDataFromStorage(shotType) {
        return Storage.getValue(shotType);
    }

    function logShotData() {
        System.println("Durée du coup: " + getDuration() + "s");
        System.println("Nombre d'échantillons: " + accelerometerReadings.size());
    }

    function onReady() {
        view.setResultText("Prêt ! Bougez pour commencer");
        WatchUi.requestUpdate();  // Mise
    }

    function onPrepare() {
        view.setResultText("Préparez votre coup");
        WatchUi.requestUpdate();  // Mise à jour de l'affichage
    }

    function saveSwing() {
        setShotDataToStorage(shotType, {
            : accelerometerData => accelerometerReadings,
            : gyroscopeData => gyroscopeReadings,
            : timestamp => timestamp
        });
        // Implémentez ici la sauvegarde des données de swing
    }

    function processMotion(info) {
        // 4. Détection de la fin du mouvement avec temporisation
        if ((info has
             : accelerometerData) &&
            (info.accelerometerData != null) &&
            (info has
             : gyroscopeData) &&
            (info.gyroscopeData != null)) {
            var accelMagnitude = calculateMagnitude(info.accelerometerData, true);
            var gyroMagnitude = calculateMagnitude(info.gyroscopeData, false);
            System.println("accelerometerReadings: " + accelerometerReadings);
            System.println("gyroMagnitude: " + gyroMagnitude);

            // 1. Détection de l'état "Prêt"
            if (accelMagnitude < 2 && gyroMagnitude < 50) {
                onReady();  // Afficher "Prêt"
            }

            // 2. Détection de l'état "Préparez votre coup"
            else if (accelMagnitude >= 2 && accelMagnitude < thresholdAccel && gyroMagnitude < thresholdGyro) {
                onPrepare();  // Afficher "Préparez votre coup"
            }

            // 3. Détection du début du mouvement (déclenchement de l'enregistrement)
            else if (accelMagnitude > thresholdAccel && gyroMagnitude > thresholdGyro) {
                startRecording();
                onMotionStart();  // Afficher "Frappez !"
            }
            // 4. Détection de la fin du mouvement avec temporisation
            if (isRecording) {
                var currentTime = System.getTimer();
                if (accelMagnitude < 3 && gyroMagnitude < 100) {
                    if (currentTime - lastSignificantMotion > motionTimeout) {
                        stopRecording();
                        onMotionEnd();  // Afficher "Enregistrement terminé"
                    }
                } else {
                    lastSignificantMotion = currentTime;
                }
            }
        }
    }

    function calculateMagnitude(data, isAccelerometer) {
        if (data != null && data.x != null && data.y != null && data.z != null) {
            var xValue = data.x[0];
            var yValue = data.y[0];
            var zValue = data.z[0];

            // Conversion pour l'accéléromètre: de milli-g à m/s²
            if (isAccelerometer) {
                // Diviser par 100 pour convertir milli-g en m/s²
                // (1000 milli-g = 1g = 9.8 m/s², donc environ /100)
                xValue = xValue / 100;
                yValue = yValue / 100;
                zValue = zValue / 100;
            }

            return Math.sqrt(xValue * xValue + yValue * yValue + zValue * zValue);
        }
        return 0;
    }

    function compareWithReference() {
        System.println("ForehandDetector -- compareWithReference ");
        if (referenceData == null || accelerometerReadings.size() == 0) {
            return 0;  // Pas de données à comparer
        }

        // Calcul simple de similitude (à améliorer selon vos besoins)
        var similarity = 0;
        // Implémentez ici votre algorithme de comparaison

        return similarity;
    }

    function setReferenceData(refData) {
        referenceData = refData;
    }
}
