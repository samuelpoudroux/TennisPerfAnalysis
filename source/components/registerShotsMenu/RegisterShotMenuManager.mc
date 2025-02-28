using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.System;

class RegisterShotMenuManager {
    function showMenu() {
        var registerShotMenuView = new RegisterShotMenuView();
        var registerShotMenuDelegate = new RegisterShotMenuDelegate();
        WatchUi.pushView(registerShotMenuView, registerShotMenuDelegate, WatchUi.SLIDE_IMMEDIATE);
    }
}
