using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;

class RegisterForehandShotDelegate extends WatchUi.BehaviorDelegate {
    var registerShotMenuManager;

    function initialize() {
        BehaviorDelegate.initialize();
        registerShotMenuManager = new RegisterShotMenuManager();
    }

    function onBack() {
        System.println("RegisterForehandShotDelegate onBack ");
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return true;
    }

    function onMenu() {
        registerShotMenuManager.showMenu();
        return true;
    }

    function onKey(e) {
        System.println("RegisterForehandShotDelegate + " + e.getKey());

        if (e.getKey() == WatchUi.KEY_ENTER) {
            WatchUi.pushView(new RegisterShotRunningView(), new RegisterShotRunningDelegate(new RegisterShotRunningView()), WatchUi.SLIDE_IMMEDIATE);
            return true;
        }
        return false;
    }

    function onSelect() {
        // Handle the touch event here
        System.println("Button pressed!");
        WatchUi.pushView(new RegisterShotRunningView(), new RegisterShotRunningDelegate(new RegisterShotRunningView()), WatchUi.SLIDE_IMMEDIATE);
        return true;  // Indicate that the event has been handled
    }
}