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
}