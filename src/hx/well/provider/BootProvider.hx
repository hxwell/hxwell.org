package hx.well.provider;
import hx.well.route.Route;
import hx.well.handler.AbortHandler;
import hx.well.handler.PublicApiHandler;
class BootProvider extends AbstractProvider {
    public function boot():Void {
        Route.domain("api.hxwell.org").group(() -> {
            Route.get("/")
                .handler(new PublicApiHandler());

            Route.get("/{any}")
                .handler(new PublicApiHandler())
                .where("any", ".*");
        });


        Route.get("/abort/{code}")
            .handler(new AbortHandler())
            .where("code", "\\b[1-5][0-9]{2}\\b");
    }
}
