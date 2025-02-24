using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Application;

// Classe principale de l'application
class TennisPerfAnalysisApp extends Application.AppBase {
    function initialize() {
        AppBase.initialize();
    }

    // Création de la vue initiale
    function getInitialView() {
        return [ new HomeView(), new HomeViewDelegate() ];
    }
}
