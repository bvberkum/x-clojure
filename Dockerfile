FROM clojure
RUN mkdir -p /usr/src && rm -rf /src/src/app || true
RUN lein new hello-world && mv hello-world /usr/src/app
WORKDIR /usr/src/app
RUN find .
COPY project.clj /usr/src/app/
COPY core.clj /usr/src/app/src/hello_world/
RUN lein deps
RUN mv "$(lein uberjar | sed -n 's/^Created \(.*standalone\.jar\)/\1/p')" app-standalone.jar
RUN find .
CMD ["java", "-jar", "app-standalone.jar"]
