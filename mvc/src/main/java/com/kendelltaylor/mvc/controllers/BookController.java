package com.kendelltaylor.mvc.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kendelltaylor.mvc.models.Book;
import com.kendelltaylor.mvc.services.BookService;

@Controller
public class BookController {
	
	@Autowired
	BookService bookService;
	
	// this is same as above
	
	@RequestMapping("/books")
	public String index(Model model)
	{
		List<Book> books = bookService.allBooks();
		model.addAttribute("books", books);
		return "index.jsp";
	}
	
	@GetMapping("/books/{bookId}")
	public String showBook(Model model, @PathVariable("bookId") Long bookId)
	{
		Book book = bookService.findBook(bookId);
		
		model.addAttribute("book", book);
		
		return "show.jsp";
	}
	
//	@PostMapping("/books")
//	public String create (@RequestParam("title") String title, @RequestParam("description") String description,
//			@RequestParam("language") String language, @RequestParam("pages") Integer numberOfPages)
//	{
//		// CODE TO MAKE A NEW BOOK AND SAVE TO THE DB
//		Book book = new Book(title, description, language, numberOfPages);
//		bookService.createBook(book);
//		
//		return "redirect:/books";
//	}
	
	// SIMILAR AS CODE ABOVE
	@PostMapping("/books")
	public String create (@Valid @ModelAttribute("book") Book book, BindingResult result)
	{	
		if (result.hasErrors())
		{
			return "new.jsp";
		}

		bookService.createBook(book);
		
		return "redirect:/books";
	}
	
//	@GetMapping("/books/new")
//	public String newBook () {
//		return "new.jsp";
//	}
	
	// SIMILAR AS CODE ABOVE
	@GetMapping("/books/new")
	public String newBook (@ModelAttribute("book") Book book) {
		return "new.jsp";
	}
	
	@GetMapping("/books/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model)
	{
		Book book = bookService.findBook(id);
		model.addAttribute("book", book);
		return "edit.jsp";
	}
	
	@PutMapping("/books/{id}")
	public String update(@Valid @ModelAttribute("book") Book book, BindingResult result)
	{
		if (result.hasErrors())
		{
			return "edit.jsp";
		}
		else
		{
			bookService.updateBook(book);
			return "redirect:/books";
		}
	}
}
