
using Toybox.WatchUi;
using Toybox.Graphics;

class MenuDelegate extends WatchUi.Menu2InputDelegate {
    function initialize() {
        System.println("MenuDelegate initialized!");
        Menu2InputDelegate.initialize();
    }

    // Gestion des sélections de menu - ne doit pas retourner de valeur
    function onSelect(item) {
        var id = item.getId();
        // WatchUi.popView(WatchUi.SLIDE_RIGHT);

        if (id == : register_shots) {
            // Ouvrir la page blanche
            WatchUi.pushView(new RegisterShotsView(), new RegisterShotsDelegate(), WatchUi.SLIDE_LEFT);
        } else if (id == : option2) {
            // Gérer d'autres options de menu
        }

        // Ne pas retourner de valeur dans cette fonction
    }

    function onBack() {
        System.println("menu delegate onBack ");
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return;
    }
}