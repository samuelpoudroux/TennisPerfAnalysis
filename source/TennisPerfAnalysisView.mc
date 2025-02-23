import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.System;  // Import nécessaire pour les logs

class TennisPerfAnalysisView extends WatchUi.View {

    function initialize() {
        System.println("TennisPerfAnalysisView: initialize");
        View.initialize();
    }

    // Affichage de la vue avec dessin
    function onUpdate(dc) {
        System.println("TennisPerfAnalysisView: onUpdate");
        dc.setColor(Graphics.COLOR_WHITE,  Graphics.COLOR_TRANSPARENT);  // Choisir une couleur de fond claire
        dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2,                      // Centre horizontal
            dc.getHeight() / 2.6,                     // Position verticale ajustée
            Graphics.FONT_SMALL,                    // Taille de la police
            "Appuyez START pour les instructions",  // Texte affiché
            Graphics.TEXT_JUSTIFY_CENTER            // Justification
        );
    }

    // Quand la vue est affichée à l'écran
    function onShow() {
        System.println("TennisPerfAnalysisView: onShow");
    }

    // Quand la vue est retirée de l'écran
    function onHide() {
        System.println("TennisPerfAnalysisView: onHide");
    }


}

