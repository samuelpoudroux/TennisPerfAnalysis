using Toybox.WatchUi;
using Toybox.Graphics;

class MenuView extends WatchUi.Menu2 {
    function initialize() {
        // Menu2.initialize() doit avoir un dictionnaire comme paramètre
        Menu2.initialize(null);
        setTitle("Tennis Perf Analysis");

        // Ajout d'éléments au menu
        addItem(new WatchUi.MenuItem("Enregistrer mes coups", null, : register_shots, null));
        addItem(new WatchUi.MenuItem("Option 2", null, : option2, null));
        // Ajoutez d'autres options de menu selon vos besoins
    }
}