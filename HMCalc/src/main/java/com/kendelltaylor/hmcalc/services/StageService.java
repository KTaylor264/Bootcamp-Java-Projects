package com.kendelltaylor.hmcalc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kendelltaylor.hmcalc.models.Stage;
import com.kendelltaylor.hmcalc.repositories.StageRepository;

@Service
public class StageService {
	private final StageRepository stageRepo;

	public StageService(StageRepository stageRepo) {
		this.stageRepo = stageRepo;
	}
	
	public List<Stage> findAll()
	{
		return stageRepo.findAll();
	}
	
	public Stage findStage(Long id)
	{
		Optional<Stage> optionalStage = stageRepo.findById(id);
		
		if (optionalStage.isPresent())
		{
			return optionalStage.get();
		}
		else
		{
			return null;
		}
	}
}
