package com.example.demo.service;

import com.example.demo.model.Book;
import com.example.demo.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {

    @Autowired
    private BookRepository repository;

    public List<Book> listAll() {
        return repository.findAll();
    }

    public Book get(Long id) {
        return repository.findById(id).orElse(null);
    }

    public void save(Book book) {
        repository.save(book);
    }

    public void delete(Long id) {
        repository.deleteById(id);
    }
}
