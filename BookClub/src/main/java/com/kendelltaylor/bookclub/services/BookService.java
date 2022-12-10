package com.kendelltaylor.bookclub.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kendelltaylor.bookclub.models.Book;
import com.kendelltaylor.bookclub.repositories.BookRepository;

@Service
public class BookService {
	private final BookRepository bookRepo;
	
	public BookService (BookRepository bookRepository)
	{
		this.bookRepo = bookRepository;
	}
	
    // returns all the books
    public List<Book> allBooks()
    {
        return bookRepo.findAll();
    }
    
    // retrieves a book
    public Book findBook(Long id)
    {
        Optional<Book> optionalBook = bookRepo.findById(id);
        if (optionalBook.isPresent())
        {
            return optionalBook.get();
        }
        else
        {
            return null;
        }
    }
    
    // creates a book
    public Book createBook(Book b)
    {
        return bookRepo.save(b);
    }
    
    public Book updateBook(Book book)
    {
    	Optional<Book> optionalBook = bookRepo.findById(book.getId());
    	if (optionalBook.isPresent())
    	{
    		optionalBook.get().setTitle(book.getTitle());
    		optionalBook.get().setAuthor(book.getAuthor());
    		optionalBook.get().setThoughts(book.getThoughts());
    		
    		return bookRepo.save(optionalBook.get());
    	}
    	else
    	{
    		return null;
    	}
    }
}
