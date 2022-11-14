package com.kendelltaylor.omikujiform.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OmikujiController {

	@RequestMapping("/")
	public String index()
	{
		return "index.jsp";
	}
	
	@RequestMapping("/send")
	public String send(@RequestParam(value="year") String year, @RequestParam(value="city") String city,
			@RequestParam(value="person") String person, @RequestParam(value="hobby") String hobby, @RequestParam(value="alive") String alive,
			@RequestParam(value="quote") String quote, HttpSession session)
	{
		session.setAttribute("year", year);
		session.setAttribute("city", city);
		session.setAttribute("person", person);
		session.setAttribute("hobby", hobby);
		session.setAttribute("alive", alive);
		session.setAttribute("quote", quote);
		
		return "redirect:/show";
	}
	
	@RequestMapping("/show")
	public String show()
	{
		return "show.jsp";
	}
}
