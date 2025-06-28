#!/bin/bash

echo "📚 Adding Book entity, repository, and controller..."

# Create folders if they don’t exist
mkdir -p backend/src/main/java/dev/akashpatil/library/model
mkdir -p backend/src/main/java/dev/akashpatil/library/repository

# Book.java
cat <<EOF > backend/src/main/java/dev/akashpatil/library/model/Book.java
package dev.akashpatil.library.model;

import jakarta.persistence.*;

@Entity
public class Book {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String title;
    private String author;
    private int publishedYear;

    // Getters and Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public int getPublishedYear() { return publishedYear; }
    public void setPublishedYear(int year) { this.publishedYear = year; }
}
EOF

# BookRepository.java
cat <<EOF > backend/src/main/java/dev/akashpatil/library/repository/BookRepository.java
package dev.akashpatil.library.repository;

import dev.akashpatil.library.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Long> {
}
EOF

# BookController.java
cat <<EOF > backend/src/main/java/dev/akashpatil/library/controller/BookController.java
package dev.akashpatil.library.controller;

import dev.akashpatil.library.model.Book;
import dev.akashpatil.library.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/books")
public class BookController {

    @Autowired
    private BookRepository bookRepository;

    @PostMapping
    public Book addBook(@RequestBody Book book) {
        return bookRepository.save(book);
    }

    @GetMapping
    public List<Book> getAllBooks() {
        return bookRepository.findAll();
    }
}
EOF

echo "✅ Book API files created!"
