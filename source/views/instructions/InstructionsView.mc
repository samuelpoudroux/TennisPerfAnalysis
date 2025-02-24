using Toybox.Application;
using Toybox.WatchUi;
using Toybox.Graphics;

class InstructionsView extends WatchUi.View {
    var step;
    var buttonX;
    var buttonY;
    var buttonWidth;
    var buttonHeight;

    function initialize(stepParam) {
        View.initialize();
        self.step = stepParam;
    }

    function onUpdate(dc) {
        System.println("InstructionsView onUpdate");
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());

        buttonWidth = 150;
        buttonHeight = 60;
        buttonX = dc.getWidth() / 2;
        buttonY = dc.getHeight() / 2 - 30;

        System.println("TennisPerfAnalysisView: onUpdate");
        // dc.setColor(Graphics.COLOR_WHITE,  Graphics.COLOR_TRANSPARENT);  // Choisir une couleur de fond claire
        // dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());

        var instruction;

        var instructions = [
            "Simulez un coup droit", "Simulez un revers", "Simulez un service", "Simulez un slice",
            "Simulez une volée coup droit", "Simulez une volée revers"
        ];

        // Dessiner le bouton
        if (self.step == null) {
            drawButton(dc, "Démarrer Simulation");
        } else {
            System.println("InstructionsView step" + '' + self.step);
            instruction = (self.step < instructions.size()) ? instructions[self.step] : "Configuration terminée";
            System.println("InstructionsView Instruction" + '' + instruction);
            dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
            dc.drawText(dc.getWidth() / 2, dc.getHeight() / 2 - 30, Graphics.FONT_SYSTEM_TINY, instruction,
                        Graphics.TEXT_JUSTIFY_CENTER);
        }
    }

    function onStop() {
        System.println("InstructionsView onStop");
    }

    function drawButton(dc, text) {
        // Dessin du rectangle du bouton
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawRectangle(buttonX, buttonY, buttonWidth, buttonHeight);

        // Dessin du texte du bouton
        dc.drawText(buttonX, buttonY, Graphics.FONT_SYSTEM_TINY, text, Graphics.TEXT_JUSTIFY_CENTER);
    }
}