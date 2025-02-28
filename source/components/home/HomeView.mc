using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.Timer;
using Toybox.Lang;

class HomeView extends WatchUi.View {
    var textArea;
    var screenWidth;
    var screenHeight;
    var buttonColor = Graphics.COLOR_BLACK;
    var buttonTextColor = Graphics.COLOR_WHITE;
    var homeLogo;

    function initialize() {
        View.initialize();
    }

    function onLayout(dc) {
        screenWidth = dc.getWidth();
        screenHeight = dc.getHeight();
        homeLogo = WatchUi.loadResource(Rez.Drawables.homeLogo);

        // Démarrer l'animation automatiquement lorsque la vue est chargée
    }

    function onUpdate(dc) {
        dc.clear();
        ScreenUtils.clearScreenDefault(dc, Graphics.COLOR_WHITE);

        if (homeLogo != null) {
            // Calculer la position pour centrer l'image
            var imgWidth = homeLogo.getWidth();
            var imgHeight = homeLogo.getHeight();
            var x = (screenWidth - imgWidth) / 2;
            var y = (screenHeight - imgHeight) / 2;

            // Dessiner l'image
            dc.drawBitmap(x, y, homeLogo);
        }

        // Puis dessiner le reste de votre interface
        ScreenUtils.drawTextAt(dc, screenWidth / 2, screenHeight / 6, "Tennis perf analyse", Graphics.FONT_XTINY,
                               Graphics.COLOR_BLACK, Graphics.TEXT_JUSTIFY_CENTER);

        ScreenUtils.drawButton(dc, "Commencer", screenWidth / 2, screenHeight - 100, 0, 0, Graphics.COLOR_BLACK,
                               Graphics.COLOR_WHITE, 10);
    }
}