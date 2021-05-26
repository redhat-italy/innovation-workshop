package com.acme.bookstore.jpa;

import com.acme.bookstore.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BooksCatalogRepository extends JpaRepository<Book, Integer> {

}