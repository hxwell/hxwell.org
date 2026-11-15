hxwell.org, JVM build

Requirements: Java 21 or newer.

Start:
    ./start.sh

The first run creates .env from .env.example and generates APP_KEY.
Edit .env to change HOST, PORT and the connection limits. Extra JVM
options can be passed with JAVA_OPTS, for example:
    JAVA_OPTS="-Xmx256m" ./start.sh

Files:
    hxwell.jar     the server (HxWell with the Crossbyte HTTP driver)
    public/        static files served by the site
    .env.example   configuration template
