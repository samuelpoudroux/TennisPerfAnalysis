using Toybox.Application;
using Toybox.WatchUi;
using Toybox.Graphics;

class InstructionsView extends WatchUi.View {
    var step;

    function initialize(stepParam) {
        View.initialize();
        self.step = stepParam;
    }

    function onUpdate(dc) {
    System.println("InstructionsView onUpdate");
    dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
    dc.fillRectangle(0, 0, dc.getWidth(), dc.getHeight());

            var instructions = [
            "Simulez un coup droit",
            "Simulez un revers",
            "Simulez un service",
            "Simulez un slice",
            "Simulez une volée coup droit",
            "Simulez une volée revers"
        ];

        var instruction = (step < instructions.size()) ? instructions[step] : "Configuration terminée";
                System.println("InstructionsView Instruction" + '' + instruction);

        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);

        dc.drawText(
            200,
            200,
            Graphics.FONT_SMALL,
            instruction,
            Graphics.TEXT_JUSTIFY_CENTER
        );
    }
   
}