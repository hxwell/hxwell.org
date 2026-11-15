package hx.well.config;
import hx.well.server.instance.IInstance;
import hx.well.http.driver.crossbyte.CrossbyteInstance;
import hx.well.facades.Environment.env;
using Std;

class InstanceConfig implements IConfig {
    public function new() {}

    public function get():Array<IInstance> {
        return [
            CrossbyteInstance.builder()
            .setHost(env("HOST", "0.0.0.0"))
            .setPort(env("PORT", "80").parseInt())
            .setMaxConnections(env("MAX_CONNECTIONS", "1000").parseInt())
            .setMaxConcurrentRequests(env("MAX_CONCURRENT_REQUESTS", "256").parseInt())
            .configureHttp(http -> {
                http.http2Enabled = true;
                http.requestTimeout = 15;
                http.compression.enabled = true;
            })
            .build()
        ];
    }
}
