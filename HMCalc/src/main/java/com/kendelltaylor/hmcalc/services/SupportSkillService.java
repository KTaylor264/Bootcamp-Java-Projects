package com.kendelltaylor.hmcalc.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kendelltaylor.hmcalc.models.SupportSkill;
import com.kendelltaylor.hmcalc.repositories.SupportSkillRepository;

@Service
public class SupportSkillService {
	private final SupportSkillRepository supportSkillRepo;

	public SupportSkillService(SupportSkillRepository supportSkillRepo) {
		this.supportSkillRepo = supportSkillRepo;
	}
	
	public List<SupportSkill> findAll()
	{
		return supportSkillRepo.findAll();
	}
	
	public SupportSkill findSupportSkill(Long id)
	{
		Optional<SupportSkill> optionalSupportSkill = supportSkillRepo.findById(id);
		
		if (optionalSupportSkill.isPresent())
		{
			return optionalSupportSkill.get();
		}
		else
		{
			return null;
		}
	}
}
