using Toybox.WatchUi;

class DataCollectorView extends WatchUi.View {
    var step;

    function initialize(step) {
        View.initialize();
        self.step = step;
    }

    function onEnter() {
        // Simulation de collecte de données (remplacer par les capteurs réels plus tard)
        System.println("Collecte des données pour l'étape " + self.step);
    }

    function onUpdate(dc) {
                System.println("DataCollectorView--onUpdate--step" + self.step);

        dc.clear();
   dc.drawText(
            30,  // x
            70,  // y
            Graphics.FONT_MEDIUM,
            "Collecte en cours...",
            Graphics.TEXT_JUSTIFY_CENTER
        );    }

    
}