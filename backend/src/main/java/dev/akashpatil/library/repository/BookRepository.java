package dev.akashpatil.library.repository;

import dev.akashpatil.library.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Long> {
}
