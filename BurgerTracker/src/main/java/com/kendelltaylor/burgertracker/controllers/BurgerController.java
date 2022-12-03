package com.kendelltaylor.burgertracker.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

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
		
		model.addAttribute("burgers", burgers);
		
		return "index.jsp";
	}
	
	@GetMapping("/burgers/edit/{id}")
	public String editBurger (@PathVariable("id") Long id, Model model)
	{
		Burger burger = burgerService.findBurger(id);
		model.addAttribute("burger", burger);
		return "edit.jsp";
	}
	
	@PutMapping("/burgers/{id}")
	public String update (@Valid @ModelAttribute("burger") Burger burger, BindingResult result)
	{
		if (result.hasErrors())
		{
			return "edit.jsp";
		}
		else
		{
			burgerService.updateBurger(burger);
			return "redirect:/";
		}
	}
}
