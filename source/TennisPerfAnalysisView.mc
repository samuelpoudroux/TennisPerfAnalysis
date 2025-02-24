import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.System; // Import nécessaire pour les logs

class TennisPerfAnalysisView extends WatchUi.View {
    function initialize() {
        System.println("TennisPerfAnalysisView: initialize");
        View.initialize();
    }

    // Quand la vue est affichée à l'écran
    function onShow() {
        System.println("TennisPerfAnalysisView: onShow");
        // WatchUi.pushView(new InstructionsView(null), new InstructionsViewDelegate(null), WatchUi.SLIDE_IMMEDIATE);
    }

    function onUpdate(dc) {
        System.println("TennisPerfAnalysisView: onUpdate");
    }

    // Quand la vue est retirée de l'écran
    function onHide() {
        System.println("TennisPerfAnalysisView: onHide");
    }

    function onStop() {
        System.println("Vue arrêtée");
    }
}
