package com.kendelltaylor.dojosandninjas.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.kendelltaylor.dojosandninjas.models.Dojo;
import com.kendelltaylor.dojosandninjas.models.Ninja;
import com.kendelltaylor.dojosandninjas.services.DojoService;
import com.kendelltaylor.dojosandninjas.services.NinjaService;

@Controller
public class DojoNinjaController {
	private final DojoService dojoService;
	private final NinjaService ninjaService;
	
	public DojoNinjaController (DojoService dojoService, NinjaService ninjaService)
	{
		this.dojoService = dojoService;
		this.ninjaService = ninjaService;
	}
	
	@GetMapping("/dojo-ninja")
	public String index (Model model)
	{
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		
		return "index.jsp";
	}
	
	@GetMapping("/dojos/new")
	public String newDojo (@ModelAttribute("dojo") Dojo dojo)
	{
		return "newDojo.jsp";
	}
	
	@PostMapping("/create-dojo")
	public String createDojo (@Valid @ModelAttribute("dojo") Dojo dojo, BindingResult result)
	{
		if (result.hasErrors())
		{
			return "newDojo.jsp";
		}
		else
		{
			dojoService.createDojo(dojo);
			return "redirect:/dojo-ninja";
		}
	}
	
	@GetMapping("/ninjas/new")
	public String newNinja (@ModelAttribute("ninja") Ninja ninja, Model model)
	{
		List<Dojo> dojos = dojoService.allDojos();
		model.addAttribute("dojos", dojos);
		
		return "newNinja.jsp";
	}
	
	@PostMapping("/create-ninja")
	public String createNinja (@Valid @ModelAttribute("ninja") Ninja ninja, BindingResult result)
	{
		if (result.hasErrors())
		{
			return "newNinja.jsp";
		}
		else
		{
			ninjaService.createNinja(ninja);
			return "redirect:/dojo-ninja";
		}
	}
	
	@GetMapping("/dojo-ninja/show/{id}")
	public String showDojo (@PathVariable("id") Long id, Model model)
	{
		model.addAttribute("dojo", dojoService.findDojo(id));
		return "showDojo.jsp";
	}

}
