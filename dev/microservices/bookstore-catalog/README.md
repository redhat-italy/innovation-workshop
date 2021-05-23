# Manual deploy


## build the app locally

```
cd spring-boot-rest-service
```

```
mvn clean package spring-boot:repackage
```

## Create the binary builder

We can create the builder for our application:

```
oc new-app redhat-openjdk18-openshift:1.8 --binary --name=bookstore-catalog
```

```
oc start-build bookstore-catalog --from-file target/bookstore-catalog-1.0.jar
```

## Expose the service as route.

```
oc expose svc bookstore-catalog
```

# Setup local database
                                  
Start a postgres docker container:

```docker run --name bookstoredb -e POSTGRES_PASSWORD=password1 -e POSTGRES_USER=user1 -e POSTGRES_DB=bookstore -p 5432:5432 -d postgres```

Setup the DB data:

```cat extra/books-setup.sql | docker exec -i bookstoredb psql -U user1 -d bookstore```

# Run the app locally

```mvn clean spring-boot:run -Dspring-boot.run.profiles=local```
