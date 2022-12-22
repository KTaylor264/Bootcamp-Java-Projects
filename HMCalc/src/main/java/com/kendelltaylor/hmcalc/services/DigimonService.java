package com.kendelltaylor.hmcalc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kendelltaylor.hmcalc.models.Digimon;
import com.kendelltaylor.hmcalc.repositories.DigimonRepository;

@Service
public class DigimonService {
	private final DigimonRepository digimonRepo;

	public DigimonService(DigimonRepository digimonRepo) {
		this.digimonRepo = digimonRepo;
	}
	
	public List<Digimon> findAll()
	{
		return digimonRepo.findAll();
	}
	
	public Digimon findDigimon(Long id)
	{
		Optional<Digimon> optionalDigimon = digimonRepo.findById(id);
		
		if (optionalDigimon.isPresent())
		{
			return optionalDigimon.get();
		}
		else
		{
			return null;
		}
	}
}
