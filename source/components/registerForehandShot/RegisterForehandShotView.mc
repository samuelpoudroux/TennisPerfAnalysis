using Toybox.WatchUi;
using Toybox.Graphics;

class RegisterForehandShotView extends WatchUi.View {
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
        text = "ForHandView";
        var textAreaHeight = screenHeight / 3;
        var margin = 10;
    }

    function onUpdate(dc) {
        System.println("registerForhandView onUpdate");

        // 🔹 Définir la couleur du texte
        // Afficher le titre
        ScreenUtils.clearScreenDefault(dc, Graphics.COLOR_WHITE);

        // Puis dessiner le reste de votre interface
        ScreenUtils.drawTitle(dc, "Forehand Shot", Graphics.FONT_MEDIUM, Graphics.COLOR_BLACK);
    }

    // function drawButton(dc, label, x, y) {
    //     var buttonWidth = 10;
    //     var buttonHeight = 10;
    //     var cornerRadius = 5;

    //     dc.setColor(buttonColor, Graphics.COLOR_WHITE);
    //     dc.fillRoundedRectangle(x - buttonWidth / 2, y - buttonHeight / 2, buttonWidth, buttonHeight, cornerRadius);

    //     dc.setColor(buttonTextColor, buttonColor);
    //     dc.drawText(x, y, Graphics.FONT_TINY, label, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    // }
}