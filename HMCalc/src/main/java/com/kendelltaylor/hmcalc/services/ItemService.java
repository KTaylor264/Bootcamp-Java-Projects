package com.kendelltaylor.hmcalc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kendelltaylor.hmcalc.models.Item;
import com.kendelltaylor.hmcalc.repositories.ItemRepository;

@Service
public class ItemService {
	private final ItemRepository itemRepo;

	public ItemService(ItemRepository itemRepo) {
		this.itemRepo = itemRepo;
	}
	
	public List<Item> findAll()
	{
		return itemRepo.findAll();
	}
	
	public Item findItem(Long id)
	{
		Optional<Item> optionalItem = itemRepo.findById(id);
		
		if (optionalItem.isPresent())
		{
			return optionalItem.get();
		}
		else
		{
			return null;
		}
	}
}
