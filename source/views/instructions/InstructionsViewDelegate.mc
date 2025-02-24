import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

class InstructionsViewDelegate extends WatchUi.BehaviorDelegate {
    var step;

    // Initialisation avec l'étape actuelle
    function initialize(step) {
        self.step = step;
        BehaviorDelegate.initialize();
    }

    // Gestion du menu
    function onMenu() as Boolean {
        WatchUi.pushView(
            new Rez.Menus.MainMenu(),
            new TennisPerfAnalysisMenuDelegate(),
            WatchUi.SLIDE_UP
        );
        return true;
    }

    // Gestion de la touche START/ENTER et ESC
    function onKey(evt) {
        System.println("InstructionsViewDelegate - Touche appuyée key : " + evt.getKey());
        System.println("InstructionsViewDelegate - Touche appuyée : " + WatchUi.KEY_ESC);
        System.println("InstructionsViewDelegate - step : " + step);

        if (evt.getKey() == WatchUi.KEY_ENTER) {
            updateStep(self.step == null ? 0 : self.step + 1);

            WatchUi.pushView(new InstructionsView(self.step), new InstructionsViewDelegate(self.step),
                             WatchUi.SLIDE_IMMEDIATE);
        } else if (evt.getKey() == WatchUi.KEY_ESC) {
            if (self.step == 0 || self.step == null) {
                WatchUi.pushView(new TennisPerfAnalysisView(), new TennisPerfAnalysisDelegate(),
                                 WatchUi.SLIDE_IMMEDIATE);
            } else {
                updateStep(step - 1);
                WatchUi.pushView(new InstructionsView(self.step), new InstructionsViewDelegate(self.step),
                                 WatchUi.SLIDE_IMMEDIATE);
            }

                    return true;

            
        }

        return true;
    }

    // Mise à jour de l'étape
    function updateStep(step) {
        self.step = step;
    }
}
