using Toybox.WatchUi;
using Toybox.Graphics;

class HomeView extends WatchUi.View {
    var textArea;
    var screenWidth;
    var screenHeight;
    var buttonColor = Graphics.COLOR_BLACK;
    var buttonTextColor = Graphics.COLOR_WHITE;

    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
        screenWidth = dc.getWidth();
        screenHeight = dc.getHeight();
    }

    function onUpdate(dc) {
        dc.clear();

        ScreenUtils.clearScreenDefault(dc, Graphics.COLOR_WHITE);

        // Puis dessiner le reste de votre interface
        ScreenUtils.drawTextAt(dc, screenWidth / 2, screenHeight / 3, "Tennis perf analyse", Graphics.FONT_TINY,
                               Graphics.COLOR_BLACK, Graphics.TEXT_JUSTIFY_CENTER);

        // Dessiner le bouton
        ScreenUtils.drawButton(dc,                      // dc context
                               "Commencer Simulation",  // button label
                               screenWidth / 2,         // x position
                               screenHeight - 200,      // y position
                               180,                     // button width
                               40,                      // button height
                               buttonColor,             // button color
                               buttonTextColor,         // text color
                               5                        // corner radius
        );
    }
}