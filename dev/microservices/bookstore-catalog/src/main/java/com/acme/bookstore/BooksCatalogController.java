package com.acme.bookstore;

import com.acme.bookstore.jpa.BooksCatalogRepository;
import com.acme.bookstore.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;
import java.util.Optional;

@Configuration
@RestController
public class BooksCatalogController {

    @Autowired
    BooksCatalogRepository repository;
    
    @CrossOrigin
    @RequestMapping(value = "/books/{id}",
            produces = {MediaType.APPLICATION_JSON_VALUE})
    public Optional<Book> books(@PathVariable("id") Integer id) {
        return repository.findById(id);
    }

    @CrossOrigin
    @RequestMapping(value = "/books",
            produces = {MediaType.APPLICATION_JSON_VALUE})
    public List<Book> books() {
        return repository.findAll();
    }


}