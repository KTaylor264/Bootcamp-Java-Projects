package com.kendelltaylor.safetravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.kendelltaylor.safetravels.models.Expense;
import com.kendelltaylor.safetravels.services.ExpenseService;

@Controller
public class travelController {
	private final ExpenseService expenseService;
	
	public travelController (ExpenseService expenseService)
	{
		super();
		this.expenseService = expenseService;
	}
	
	@GetMapping("/expenses")
	public String index (Model model, @ModelAttribute("expense") Expense expense)
	{
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		
		return "index.jsp";
	}
	
	@PostMapping("/create")
	public String createExpense (@Valid @ModelAttribute("expense") Expense expense, BindingResult result)
	{
		if (result.hasErrors())
		{
			return "index.jsp";
		}
		else
		{
			expenseService.createExpense(expense);
			return "redirect:/expenses";
		}
	}
	
	@GetMapping("/expenses/edit/{id}")
	public String editExpense (@PathVariable("id") Long id, Model model)
	{
		Expense expense = expenseService.findExpense(id);
		model.addAttribute("expense", expense);
		return "edit.jsp";
	}
	
	@GetMapping("/expenses/{id}")
	public String showExpense (@PathVariable("id") Long id, Model model)
	{
		Expense expense = expenseService.findExpense(id);
		model.addAttribute("expense", expense);
		
		return "show.jsp";
	}
	
	@PutMapping("/expenses/{id}")
	public String update (@Valid @ModelAttribute("expense") Expense expense, BindingResult result)
	{
		if (result.hasErrors())
		{
			return "edit.jsp";
		}
		else
		{
			expenseService.updateExpense(expense);
			return "redirect:/expenses";
		}
	}
	
	@DeleteMapping("/expenses/{id}")
	public String destroyExpense(@PathVariable("id") Long id)
	{
		expenseService.deleteExpense(id);
		return "redirect:/expenses";
	}
}
