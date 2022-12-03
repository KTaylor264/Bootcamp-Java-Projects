package com.kendelltaylor.burgertracker.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kendelltaylor.burgertracker.models.Burger;
import com.kendelltaylor.burgertracker.services.BurgerService;

@Controller
public class BurgerController {
	private final BurgerService burgerService;
	
	public BurgerController (BurgerService _burgerService)
	{
		super();
		this.burgerService = _burgerService;
	}
	
	@PostMapping("/show")
	public String create (@Valid @ModelAttribute("burger") Burger burger, BindingResult result)
	{	
		if (result.hasErrors())
		{
			return "index.jsp";
		}

		burgerService.createBurger(burger);
		
		return "redirect:/";
	}
	
	@GetMapping("/")
	public String newBurger (Model model, @ModelAttribute("burger") Burger burger)
	{
		List<Burger> burgers = burgerService.allBurgers();
		
		for (int i = 0; i < burgers.size(); i++)
		{
			System.out.println(burgers.get(i));
		}
		
		model.addAttribute("burgers", burgers);
		
		return "index.jsp";
	}
}
