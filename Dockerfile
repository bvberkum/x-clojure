FROM clojure
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
RUN lein new hello-world
RUN tree
COPY project.clj /usr/src/app/
COPY core.clj /usr/src/app/src/hello_world/
RUN lein deps
COPY . /usr/src/app
RUN mv "$(lein uberjar | sed -n 's/^Created \(.*standalone\.jar\)/\1/p')" app-standalone.jar
CMD ["java", "-jar", "app-standalone.jar"]
