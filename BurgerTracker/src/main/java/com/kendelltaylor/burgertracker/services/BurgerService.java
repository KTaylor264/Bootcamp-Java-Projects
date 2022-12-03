package com.kendelltaylor.burgertracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kendelltaylor.burgertracker.models.Burger;
import com.kendelltaylor.burgertracker.repositories.BurgerRepository;

@Service
public class BurgerService {
	private final BurgerRepository burgerRepository;
	
	public BurgerService (BurgerRepository _burgerRepo)
	{
		this.burgerRepository = _burgerRepo;
	}
	
	// returns all the burgers
	public List<Burger> allBurgers()
	{
		return burgerRepository.findAll();
	}
	
	// creates a burger
	public Burger createBurger(Burger b)
	{
		return burgerRepository.save(b);
	}
	
	// find a burger
	public Burger findBurger(Long id)
	{
		Optional<Burger> optionalBurger = burgerRepository.findById(id);
		if (optionalBurger.isPresent())
		{
			return optionalBurger.get();
		}
		else
		{
			return null;
		}
	}
	
	// updates a burger
	public Burger updateBurger (Long id, String burgerName, String restaurantName, Integer rating)
	{
		Optional<Burger> optionalBurger = burgerRepository.findById(id);
		if (optionalBurger.isPresent())
		{
			optionalBurger.get().setBurgerName(burgerName);
			optionalBurger.get().setRestaurantName(restaurantName);
			optionalBurger.get().setRating(rating);
			
			return burgerRepository.save(optionalBurger.get());
		}
		else
		{
			return null;
		}
	}
	
	// deletes a burger
	public void deleteBurger (Long id)
	{
		Optional<Burger> optionalBurger = burgerRepository.findById(id);
		if (optionalBurger.isPresent())
		{
			burgerRepository.deleteById(id);
		}
	}
}
