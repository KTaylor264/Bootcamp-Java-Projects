package com.kendelltaylor.hmcalc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kendelltaylor.hmcalc.models.Type;
import com.kendelltaylor.hmcalc.repositories.TypeRepository;

@Service
public class TypeService {
	private final TypeRepository typeRepo;

	public TypeService(TypeRepository typeRepo) {
		this.typeRepo = typeRepo;
	}
	
	public List<Type> findAll()
	{
		return typeRepo.findAll();
	}
	
	public Type findType(Long id)
	{
		Optional<Type> optionalType = typeRepo.findById(id);
		
		if (optionalType.isPresent())
		{
			return optionalType.get();
		}
		else
		{
			return null;
		}
	}
}
