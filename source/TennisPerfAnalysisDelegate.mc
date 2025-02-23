import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;

class TennisPerfAnalysisDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    // Gestion du menu
    function onMenu() as Boolean {
        WatchUi.pushView(new Rez.Menus.MainMenu(), new TennisPerfAnalysisMenuDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

    // Gestion de la touche START/ENTER
    function onKey(evt) {
        System.println("TennisPerfAnalysisDelegate - Touche appuyée : " + evt.getKey());


        if (evt.getKey() == WatchUi.KEY_ENTER ) {
        System.println("toto");

            WatchUi.pushView(
                new InstructionsView(0),
                new InstructionsViewDelegate(0),
                WatchUi.SLIDE_IMMEDIATE
            );
        } else if (evt.getKey() == WatchUi.KEY_ESC) {
                    System.println("loup");
                     WatchUi.pushView(
                new TennisPerfAnalysisView(),
                new TennisPerfAnalysisDelegate(),
                WatchUi.SLIDE_IMMEDIATE
                     );
            return false;
        }
        return false;
    }
}
