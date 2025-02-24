using Toybox.WatchUi;
using Toybox.Graphics;

class RegisterShotMenuDelegate extends WatchUi.Menu2InputDelegate {
    function initialize() {
        Menu2InputDelegate.initialize();
    }

    // Gestion des sélections de menu - ne doit pas retourner de valeur
    function onSelect(item) {
        var id = item.getId();

        if (id == : register_forehand) {
            // Logique pour le coup droit
            WatchUi.pushView(new RegisterForehandShotView(), new RegisterForehandShotDelegate(), WatchUi.SLIDE_LEFT);
            System.println("Coup droit sélectionné");
        } else if (id == : register_backhand) {
            // Logique pour le revers
            System.println("Revers sélectionné");
        } else if (id == : register_serve) {
            // Logique pour le service
            System.println("Service sélectionné");
        } else if (id == : register_forehand_slice) {
            System.println("Slice coup droit sélectionné");
        } else if (id == : register_backhand_slice) {
            System.println("Slice revers sélectionné");
        } else if (id == : register_forehand_volley) {
            System.println("Volée coup droit sélectionnée");
        } else if (id == : register_backhand_volley) {
            System.println("Volée revers sélectionnée");
        } else if (id == : register_smash) {
            System.println("Smash sélectionné");
        } else if (id == : register_lob) {
            System.println("Lob sélectionné");
        } else if (id == : register_passing_shot) {
            System.println("Passing shot sélectionné");
        } else if (id == : register_drop_shot) {
            System.println("Amortie sélectionnée");
        } else if (id == : register_forehand_topspin) {
            System.println("Lift coup droit sélectionné");
        } else if (id == : register_backhand_topspin) {
            System.println("Lift revers sélectionné");
        } else if (id == : register_forehand_flat) {
            System.println("Coup droit à plat sélectionné");
        } else if (id == : register_backhand_flat) {
            System.println("Revers à plat sélectionné");
        }

        // Ne pas retourner de valeur dans cette fonction
    }

    function onBack() {
        System.println("registerShotMenu delegate onBack ");
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        return;
    }
}
