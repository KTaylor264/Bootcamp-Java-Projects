package com.kendelltaylor.authentication.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kendelltaylor.authentication.models.LoginUser;
import com.kendelltaylor.authentication.models.User;
import com.kendelltaylor.authentication.services.UserService;

@Controller
public class AuthenticController {
	private final UserService userService;
	
	public AuthenticController(UserService userService)
	{
		this.userService = userService;
	}
	
	@RequestMapping("/")
	public String index (@ModelAttribute("newUser") User newUser, @ModelAttribute("newLogin") LoginUser newLogin, Model model)
	{
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register (@Valid @ModelAttribute("newUser") User newUser, BindingResult result, HttpSession session, Model model)
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
		return "redirect:/home";
	}
	
	@GetMapping("/home")
	public String home(HttpSession session, Model model)
	{	
		if (session.getAttribute("isLoggedIn") != null)
		{
			Long userId = (Long) session.getAttribute("userId");				// get userId from session
			model.addAttribute("loggedUser", userService.findById(userId));		// find active user information
			
			return "home.jsp";
		}

		// user already logged out
		return "redirect:/";
		
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
		return "redirect:/home";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session, Model model)
	{
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		session.setAttribute("isLoggedIn", null);
		
		return "index.jsp";
	}
}
