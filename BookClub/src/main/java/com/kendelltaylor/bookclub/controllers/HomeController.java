package com.kendelltaylor.bookclub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.kendelltaylor.bookclub.models.Book;
import com.kendelltaylor.bookclub.models.LoginUser;
import com.kendelltaylor.bookclub.models.User;
import com.kendelltaylor.bookclub.services.BookService;
import com.kendelltaylor.bookclub.services.UserService;

@Controller
public class HomeController {
	private final UserService userService;
	private final BookService bookService;
	
	public HomeController(UserService userService, BookService bookService)
	{
		this.userService = userService;
		this.bookService = bookService;
	}
	
	@GetMapping("/")
	public String index(@ModelAttribute("newUser") User newUser, @ModelAttribute("newLogin") LoginUser newLogin)
	{
		return "index.jsp";
	}
	
	@GetMapping("/books")
	public String welcome(HttpSession session, Model model)
	{
		List<Book>books = bookService.allBooks();
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("loggedUser", userService.findById(userId));
		model.addAttribute("books", books);
		return "home.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, HttpSession session, Model model)
	{
		model.addAttribute("newLogin", new LoginUser());
		User changedUser = userService.register(newUser, result); 		// extra validations and create a new user!
		
		if (result.hasErrors())
		{
			return "index.jsp";
		}
		
		// No errors!
		session.setAttribute("userId", changedUser.getId());		// set userID for referencing
		session.setAttribute("isLoggedIn", true);					// validation that user is logged in
		return "redirect:/books";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, HttpSession session, Model model)
	{
		model.addAttribute("newUser", new User());
		User foundUser = userService.login(newLogin, result);
		
		if (result.hasErrors())
		{
			return "index.jsp";
		}
		
		// No errors!
		session.setAttribute("userId", foundUser.getId());		// set userId for referencing
		session.setAttribute("isLoggedIn", true);				// validation that user is logged in
		return "redirect:/books";
	}
	
	@GetMapping("/books/new")
	public String addBook(HttpSession session, Model model, @ModelAttribute("book") Book newBook)
	{
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("loggedUser", userService.findById(userId));
		return "create.jsp";
	}
	
	@PostMapping("/books/create")
	public String createBook(@Valid @ModelAttribute("book") Book newBook, BindingResult result, HttpSession session, Model model)
	{
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("loggedUser", userService.findById(userId));
		
		if (result.hasErrors())
		{
			return "create.jsp";
		}
		
		// No errors
		newBook.setUser(userService.findById(userId));
		bookService.createBook(newBook);
		return "redirect:/books";
	}
	
	@GetMapping("/books/{bookId}")
	public String showBook(HttpSession session, Model model, @PathVariable("bookId") Long bookId)
	{
		Book book = bookService.findBook(bookId);
		
		model.addAttribute("book", book);
		
		return "read.jsp";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		
		return "redirect:/";
	}
}
