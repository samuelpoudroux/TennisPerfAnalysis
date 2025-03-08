using Toybox.WatchUi;
using Toybox.Graphics;

class RegisterForehandShotView extends WatchUi.View {
    var screenWidth;
    var screenHeight;
    var foreHandAnimationImg;
    var animationManager;

    var forehandFrames = [
        Rez.Drawables.Frame1Forehand,  Rez.Drawables.Frame2Forehand,  Rez.Drawables.Frame3Forehand,
        Rez.Drawables.Frame4Forehand,  Rez.Drawables.Frame5Forehand,  Rez.Drawables.Frame6Forehand,
        Rez.Drawables.Frame7Forehand,  Rez.Drawables.Frame8Forehand,  Rez.Drawables.Frame9Forehand,
        Rez.Drawables.Frame10Forehand, Rez.Drawables.Frame11Forehand, Rez.Drawables.Frame12Forehand,
        Rez.Drawables.Frame13Forehand, Rez.Drawables.Frame14Forehand, Rez.Drawables.Frame15Forehand,
        Rez.Drawables.Frame16Forehand, Rez.Drawables.Frame17Forehand, Rez.Drawables.Frame18Forehand,
        Rez.Drawables.Frame19Forehand, Rez.Drawables.Frame20Forehand, Rez.Drawables.Frame21Forehand,
        Rez.Drawables.Frame22Forehand, Rez.Drawables.Frame23Forehand, Rez.Drawables.Frame24Forehand,
        Rez.Drawables.Frame25Forehand, Rez.Drawables.Frame26Forehand, Rez.Drawables.Frame27Forehand,
        Rez.Drawables.Frame28Forehand, Rez.Drawables.Frame29Forehand, Rez.Drawables.Frame30Forehand,
        Rez.Drawables.Frame31Forehand, Rez.Drawables.Frame32Forehand, Rez.Drawables.Frame33Forehand,
        Rez.Drawables.Frame34Forehand, Rez.Drawables.Frame35Forehand, Rez.Drawables.Frame36Forehand,
        Rez.Drawables.Frame37Forehand, Rez.Drawables.Frame38Forehand, Rez.Drawables.Frame39Forehand,
        Rez.Drawables.Frame40Forehand, Rez.Drawables.Frame41Forehand, Rez.Drawables.Frame42Forehand,
        Rez.Drawables.Frame43Forehand, Rez.Drawables.Frame44Forehand, Rez.Drawables.Frame45Forehand,
        Rez.Drawables.Frame46Forehand, Rez.Drawables.Frame47Forehand, Rez.Drawables.Frame48Forehand,
        Rez.Drawables.Frame49Forehand, Rez.Drawables.Frame50Forehand, Rez.Drawables.Frame51Forehand,
        Rez.Drawables.Frame52Forehand, Rez.Drawables.Frame53Forehand, Rez.Drawables.Frame54Forehand,
        Rez.Drawables.Frame55Forehand, Rez.Drawables.Frame56Forehand, Rez.Drawables.Frame57Forehand,
        Rez.Drawables.Frame58Forehand, Rez.Drawables.Frame59Forehand, Rez.Drawables.Frame60Forehand,
        Rez.Drawables.Frame61Forehand, Rez.Drawables.Frame62Forehand
    ];

    function initialize() {
        View.initialize();
        animationManager = new AnimationManager(forehandFrames, 100, method( : onAnimationUpdate));
        // Utiliser une référence method plutôt qu'une référence à this.onAnimationUpdate
    }
    function onLayout(dc) {
        screenWidth = dc.getWidth();
        screenHeight = dc.getHeight();
        foreHandAnimationImg = WatchUi.loadResource(forehandFrames[0]);
    }

    function onHide() {
        animationManager.stop();
    }

    function onAnimationUpdate(newFrame) {
        if (newFrame != null) {
            foreHandAnimationImg = WatchUi.loadResource(newFrame);

            WatchUi.requestUpdate();
        } else {
            System.println("Error: Invalid frame.");
        }
    }

    function onShow() {
        animationManager.start();
    }

    function onUpdate(dc) {
        dc.clear();
        ScreenUtils.clearScreenDefault(dc, Graphics.COLOR_WHITE);

        if (foreHandAnimationImg != null) {
            var imgWidth = foreHandAnimationImg.getWidth();
            var imgHeight = foreHandAnimationImg.getHeight();
            var x = (screenWidth - imgWidth) / 2;
            var y = (screenHeight - imgHeight) / 4;
            dc.drawBitmap(x, y, foreHandAnimationImg);
        }

        ScreenUtils.drawTextAt(dc, screenWidth / 2, screenHeight - 200, "Coup droit", Graphics.FONT_XTINY,
                               Graphics.COLOR_BLACK, Graphics.TEXT_JUSTIFY_CENTER);

        ScreenUtils.drawButton(dc, "Commencer l'analyse", screenWidth / 2, screenHeight - 100, 0, 0,
                               Graphics.COLOR_BLACK, Graphics.COLOR_WHITE, 10);
    }
}