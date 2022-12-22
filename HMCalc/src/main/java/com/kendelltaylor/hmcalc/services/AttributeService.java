package com.kendelltaylor.hmcalc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kendelltaylor.hmcalc.models.Attribute;
import com.kendelltaylor.hmcalc.repositories.AttributeRepository;

@Service
public class AttributeService {
	private final AttributeRepository attributeRepo;

	public AttributeService(AttributeRepository attributeRepo) {
		this.attributeRepo = attributeRepo;
	}
	
	public List<Attribute> findAll()
	{
		return attributeRepo.findAll();
	}
	
	public Attribute findAttribute(Long id)
	{
		Optional<Attribute> optionalAttribute = attributeRepo.findById(id);
		
		if (optionalAttribute.isPresent())
		{
			return optionalAttribute.get();
		}
		else
		{
			return null;
		}
	}
}
