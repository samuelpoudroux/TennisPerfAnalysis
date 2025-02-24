using Toybox.WatchUi;
using Toybox.Graphics;

class RegisterShotMenuView extends WatchUi.Menu2 {
    function initialize() {
        // Menu2.initialize() doit avoir un dictionnaire comme paramètre
        Menu2.initialize(null);
        setTitle("Selectionner un coup");

        // Ajout d'éléments au menu
        addItem(new WatchUi.MenuItem("Coup droit", null, : register_forehand, null));
        addItem(new WatchUi.MenuItem("Revers", null, : register_backhand, null));
        addItem(new WatchUi.MenuItem("Service", null, : register_serve, null));
        addItem(new WatchUi.MenuItem("Slice coup droit", null, : register_forehand_slice, null));
        addItem(new WatchUi.MenuItem("Slice revers", null, : register_backhand_slice, null));
        addItem(new WatchUi.MenuItem("Volée coup droit", null, : register_forehand_volley, null));
        addItem(new WatchUi.MenuItem("Volée revers", null, : register_backhand_volley, null));
        addItem(new WatchUi.MenuItem("Smash", null, : register_smash, null));
        addItem(new WatchUi.MenuItem("Lob", null, : register_lob, null));
        addItem(new WatchUi.MenuItem("Passing shot", null, : register_passing_shot, null));
        addItem(new WatchUi.MenuItem("Amortie", null, : register_drop_shot, null));
        addItem(new WatchUi.MenuItem("Lift coup droit", null, : register_forehand_topspin, null));
        addItem(new WatchUi.MenuItem("Lift revers", null, : register_backhand_topspin, null));
        addItem(new WatchUi.MenuItem("Coup droit à plat", null, : register_forehand_flat, null));
        addItem(new WatchUi.MenuItem("Revers à plat", null, : register_backhand_flat, null));

        // Ajoutez d'autres options de menu selon vos besoins
    }

    function onBack() {
        System.println("onBack ");
        // WatchUi.popView(WatchUi.SLIDE_RIGHT);
        WatchUi.pushView(new RegisterShotMenuView(), new RegisterShotMenuDelegate(), WatchUi.SLIDE_LEFT);
    }
}