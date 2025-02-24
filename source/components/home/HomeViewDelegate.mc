using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;

class HomeViewDelegate extends WatchUi.BehaviorDelegate {
    function initialize() {
        BehaviorDelegate.initialize();
    }

    // function onBack() {
    //     System.print("homeView onBack");
    //     // WatchUi.popView(WatchUi.SLIDE_RIGHT);
    //     return true;
    // }

    function onMenu() {
        System.println("Menu behavior triggered");
        WatchUi.pushView(new MenuView(), new MenuDelegate(), WatchUi.SLIDE_IMMEDIATE);
        return true;  // allow InputDelegate function to be called
    }

    function onKey(e) {
        System.println("HomeViewDelegate + " + e.getKey());

        if (e.getKey() == WatchUi.KEY_ENTER) {
            WatchUi.pushView(new RegisterShotsView(), new RegisterShotsDelegate(), WatchUi.SLIDE_IMMEDIATE);
            return true;
        }
        return false;
    }
}