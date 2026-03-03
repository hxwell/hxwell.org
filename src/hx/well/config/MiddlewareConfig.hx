package hx.well.config;
import hx.well.middleware.AbstractMiddleware;
import hx.well.middleware.CloudflareMiddleware;
import hx.well.middleware.CorsMiddleware;

class MiddlewareConfig implements IConfig {
    public function new() {}

    public function get():Array<Class<AbstractMiddleware>> {
        return [
            CloudflareMiddleware,
            CorsMiddleware
        ];
    }
}