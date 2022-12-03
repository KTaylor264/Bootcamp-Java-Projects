package com.kendelltaylor.safetravels.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kendelltaylor.safetravels.models.Expense;

@Repository
public interface ExpenseRepository extends CrudRepository<Expense, Long> {
	List<Expense> findAll();
	List<Expense> findByExpenseNameContaining(String search);
    Long countByExpenseNameContaining(String search);
    Long deleteByExpenseNameStartingWith(String search);
}
