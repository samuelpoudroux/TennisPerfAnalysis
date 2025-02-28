using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;

class RegisterShotsDelegate extends WatchUi.BehaviorDelegate {
    var registerShotMenuManager;

    function initialize() {
        BehaviorDelegate.initialize();
        registerShotMenuManager = new RegisterShotMenuManager();
    }

    function onMenu() {
        System.println("Menu behavior triggered");
        registerShotMenuManager.showMenu();
        return true;
    }

    function onKey(e) {
        System.println("RegisterShotsDelegate + " + e.getKey());
        if (e.getKey() == WatchUi.KEY_ENTER) {
            WatchUi.pushView(new RegisterForehandShotView(), new RegisterForehandShotDelegate(),
                             WatchUi.SLIDE_IMMEDIATE);

            return true;
        }
        return false;
    }
}
