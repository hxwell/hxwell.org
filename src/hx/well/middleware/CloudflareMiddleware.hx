package hx.well.middleware;

import hx.well.middleware.AbstractMiddleware;
import hx.well.http.Response;
import hx.well.http.Request;
import hx.well.http.ResponseBuilder;

class CloudflareMiddleware extends AbstractMiddleware {
    public function handle(request:Request, next:Request->Null<Response>):Null<Response> {
        var cfConnectingIp = request.header("CF-Connecting-IP");
        if (cfConnectingIp != null) {
            request.ip = cfConnectingIp; // Override the request IP with the CF-Connecting-IP value
        }

        return next(request);
    }
}
