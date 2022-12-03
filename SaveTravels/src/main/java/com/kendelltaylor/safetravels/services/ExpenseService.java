package com.kendelltaylor.safetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kendelltaylor.safetravels.models.Expense;
import com.kendelltaylor.safetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	private final ExpenseRepository expenseRepository;
	
	public ExpenseService (ExpenseRepository _expenseRepostitory)
	{
		this.expenseRepository = _expenseRepostitory;
	}
	
	public List<Expense> allExpenses()
	{
		return expenseRepository.findAll();
	}
	
	public Expense createExpense (Expense e)
	{
		return expenseRepository.save(e);
	}
	
    public Expense findExpense(Long id)
    {
        Optional<Expense> optionalExpense = expenseRepository.findById(id);
        if (optionalExpense.isPresent())
        {
            return optionalExpense.get();
        }
        else
        {
            return null;
        }
    }
    
 // updates a book
    public Expense updateExpense(Long id, String expenseName, String vendor, double amount, String description)
    {
    	Optional<Expense> optionalExpense = expenseRepository.findById(id);
    	if (optionalExpense.isPresent())
    	{
    		optionalExpense.get().setExpenseName(expenseName);
    		optionalExpense.get().setVendor(vendor);
    		optionalExpense.get().setAmount(amount);
    		optionalExpense.get().setDescription(description);
    		
    		return expenseRepository.save(optionalExpense.get());
    		
    		// return optionalBook.get();
    	}
    	else
    	{
    		return null;
    	}
    }
    
    public Expense updateExpense(Expense expense)
    {
    	Optional<Expense> optionalExpense = expenseRepository.findById(expense.getId());
    	if (optionalExpense.isPresent())
    	{
    		optionalExpense.get().setExpenseName(expense.getExpenseName());
    		optionalExpense.get().setVendor(expense.getVendor());
    		optionalExpense.get().setAmount(expense.getAmount());
    		optionalExpense.get().setDescription(expense.getDescription());
    		
    		return expenseRepository.save(optionalExpense.get());
    		
    	}
    	else
    	{
    		return null;
    	}
    }
    
    // deletes a book
    public void deleteExpense(Long id)
    {
    	Optional<Expense> optionalExpense = expenseRepository.findById(id);
    	if (optionalExpense.isPresent())
    	{
    		expenseRepository.deleteById(id);
    	}
    }
}
