using Toybox.WatchUi;
using Toybox.Graphics;

class AnimationManager {
   private
    var frames;
   private
    var frameRate;
   private
    var currentFrame = 0;
   private
    var animationTimer = new Timer.Timer();
   private
    var onFrameUpdate;

    function initialize(framesArray, frameRateMs, updateCallback) {
        System.println("AnimationManager initialisé avec callback : " + updateCallback);
        self.frames = framesArray;
        self.frameRate = frameRateMs;
        self.onFrameUpdate = updateCallback;
    }

    function start() {
        if (animationTimer != null && frames != null && onFrameUpdate != null) {
            currentFrame = 0;
            System.println("Animation démarrée avec callback : " + onFrameUpdate);
            // Utilisation de method(:updateAnimation) pour garantir le bon contexte
            animationTimer.start(method( : updateAnimation), frameRate, true);
        } else {
            System.println("Échec du démarrage de l'animation : timer, frames ou callback est null.");
        }
    }

    function updateAnimation() {
        currentFrame = (currentFrame + 1) % frames.size();


        if (self.frames[currentFrame] != null) {
            self.onFrameUpdate.invoke(self.frames[currentFrame]);
        } else {
            System.println("Erreur : Frame null à l'index " + currentFrame);
        }

        WatchUi.requestUpdate();
    }

    function stop() {
        if (animationTimer != null) {
            System.println("Animation arrêtée");
            animationTimer.stop();
        }
    }
}
