using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.System;

class ScreenUtils {
    // Function to clear the screen with a background color
    static function clearScreen(dc, backgroundColor) {
        dc.setColor(backgroundColor, backgroundColor);
        dc.clear();
    }

    // Function to clear the screen with default black background
    static function clearScreenDefault(dc, backgroundColor) {
        clearScreen(dc, backgroundColor);
    }

    // Function to draw text centered on screen
    static function drawCenteredText(dc, text, font, textColor) {
        var width = dc.getWidth();
        var height = dc.getHeight();

        dc.setColor(textColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(width / 2, height / 2, font, text, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    static function drawTextAt(dc, x, y, text, font, textColor, justification) {
        dc.setColor(textColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(x, y, font, text, justification);
    }

    // Function to draw a centered title at the top of the screen
    static function drawTitle(dc, title, font, textColor) {
        var width = dc.getWidth();

        dc.setColor(textColor, Graphics.COLOR_TRANSPARENT);
        dc.drawText(width / 2, 30, font, title, Graphics.TEXT_JUSTIFY_CENTER);
    }

    // Function to draw a rectangle with rounded corners
    static function drawRoundedRect(dc, x, y, width, height, cornerRadius, color) {
        dc.setColor(color, Graphics.COLOR_TRANSPARENT);
        dc.fillRoundedRectangle(x, y, width, height, cornerRadius);
    }

    // Function to draw a button with text
    static function drawButton(dc, label, x, y, buttonWidth, buttonHeight, buttonColor, textColor, cornerRadius) {
        // Draw the button background
        dc.setColor(buttonColor, Graphics.COLOR_TRANSPARENT);
        dc.fillRoundedRectangle(x - buttonWidth / 2, y - buttonHeight / 2, buttonWidth / 2, buttonHeight / 2,
                                cornerRadius);

        // Draw the button text
        dc.setColor(textColor, buttonColor);
        dc.drawText(x, y, Graphics.FONT_XTINY, label, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
    }

    // Function to check if coordinate is within a rectangle (for touch handling)
    static function isInRect(x, y, rectX, rectY, rectWidth, rectHeight) {
        return (x >= rectX && x <= rectX + rectWidth && y >= rectY && y <= rectY + rectHeight);
    }

    // Example implementation for a view with proper screen clearing
}