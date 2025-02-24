using Toybox.WatchUi;
using Toybox.Graphics;

class RegisterShotsView extends WatchUi.View {
    var textArea;
    var screenWidth;
    var screenHeight;
    var text;
    // var buttonColor = Graphics.COLOR_BLACK;
    // var buttonTextColor = Graphics.COLOR_WHITE;

    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
        screenWidth = dc.getWidth();
        screenHeight = dc.getHeight();
        text = "Effectuer tous les gestes en suivant le guide pour enregirster vos bons coups";
        var textAreaHeight = screenHeight / 3;
        var margin = 10;

        textArea = new WatchUi.TextArea({
            :text => text,
            :font => Graphics.FONT_SMALL,
            :locX => margin,
            :locY => 200,  // En dessous du titre
            :width => screenWidth - (2 * margin),
            :height => textAreaHeight,
            :justification => Graphics.TEXT_JUSTIFY_CENTER
        });
    }

    function onUpdate(dc) {
        ScreenUtils.clearScreenDefault(dc, Graphics.COLOR_WHITE);

        // Puis dessiner le reste de votre interface
        ScreenUtils.drawTitle(dc, "Register shot view", Graphics.FONT_MEDIUM, Graphics.COLOR_BLACK);

        // Afficher la zone de texte
    }
}