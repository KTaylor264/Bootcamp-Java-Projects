package com.kendelltaylor.hmcalc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kendelltaylor.hmcalc.models.GrowthType;
import com.kendelltaylor.hmcalc.repositories.GrowthTypeRepository;

@Service
public class GrowthTypeService {
	private final GrowthTypeRepository growthTypeRepo;

	public GrowthTypeService(GrowthTypeRepository growthTypeRepo) {
		this.growthTypeRepo = growthTypeRepo;
	}
	
	public List<GrowthType> findAll()
	{
		return growthTypeRepo.findAll();
	}
	
	public GrowthType findGrowthType(Long id)
	{
		Optional<GrowthType> optionalGrowthType = growthTypeRepo.findById(id);
		
		if (optionalGrowthType.isPresent())
		{
			return optionalGrowthType.get();
		}
		else
		{
			return null;
		}
	}
}
