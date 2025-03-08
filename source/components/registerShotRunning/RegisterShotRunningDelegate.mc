using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;

class RegisterShotRunningDelegate extends WatchUi.BehaviorDelegate {
    var registerShotMenuManager;
    var view;

    function initialize(viewRef) {
        view = viewRef;
        BehaviorDelegate.initialize();
        registerShotMenuManager = new RegisterShotMenuManager();
    }

    function onBack() {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return true;
    }

    function onMenu() {
        registerShotMenuManager.showMenu();
        if (view != null) {
            view.toto();
        }
        return true;
    }

    function onSelect() {
        // Handle the touch event here

        if (view != null) {
            view.stop();
            System.println("toto wiew!");
        }
        return true;  // Indicate that the event has been handled
    }
}