package com.acme.bookstore;

import com.acme.bookstore.jpa.BooksCatalogRepository;
import com.acme.bookstore.model.Book;
import org.jboss.resteasy.annotations.jaxrs.PathParam;

import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.util.List;


@Path("/")
public class BooksCatalogController {

    @Inject
    BooksCatalogRepository repository;

    @GET
    @Path("/books/{id}")
    @Produces({MediaType.APPLICATION_JSON})
    public Response books(@PathParam Integer id) {
        return Response.ok()
                .entity(repository.findById(id).get())
                .build();
    }

    @GET
    @Path("/books")
    @Produces({MediaType.APPLICATION_JSON})
    public List<Book> books() {
        return repository.findAll();
    }

}