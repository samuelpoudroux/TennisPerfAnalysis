using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Application;

// Classe principale de l'application
class TennisPerfAnalysisApp extends Application.AppBase {
    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        System.println("start application");
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as[Views] or [Views, InputDelegates] {
        System.println("TennisPerfAnalysisApp, getInitialView");
        return [ new TennisPerfAnalysisView(), new TennisPerfAnalysisDelegate() ];
    }
}
