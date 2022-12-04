package com.kendelltaylor.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kendelltaylor.dojosandninjas.models.Dojo;
import com.kendelltaylor.dojosandninjas.models.Ninja;
import com.kendelltaylor.dojosandninjas.repositories.DojoRepository;

@Service
public class DojoService {
	private final DojoRepository dojoRepository;

	public DojoService (DojoRepository dojoRepository)
	{
		this.dojoRepository = dojoRepository;
	}
	
	public List<Dojo> allDojos ()
	{
		return dojoRepository.findAll();
	}
	
	public Dojo createDojo (Dojo d)
	{
		return dojoRepository.save(d);
	}
	
    public Dojo findDojo (Long id)
    {
        Optional<Dojo> optionalDojo = dojoRepository.findById(id);
        if (optionalDojo.isPresent())
        {
            return optionalDojo.get();
        }
        else
        {
            return null;
        }
    } 
    
    public Dojo updateDojo (Long id, String name, List<Ninja> ninjas)
    {
    	Optional<Dojo> optionalDojo = dojoRepository.findById(id);
    	if (optionalDojo.isPresent())
    	{
    		optionalDojo.get().setName(name);
    		optionalDojo.get().setNinjas(ninjas);
    		
    		return dojoRepository.save(optionalDojo.get());
    	}
    	else
    	{
    		return null;
    	}
    }
    
    public Dojo updateDojo (Dojo dojo)
    {
    	Optional<Dojo> optionalDojo = dojoRepository.findById(dojo.getId());
    	if (optionalDojo.isPresent())
    	{
    		optionalDojo.get().setName(dojo.getName());
    		optionalDojo.get().setNinjas(dojo.getNinjas());
    		
    		return dojoRepository.save(optionalDojo.get());
    		
    	}
    	else
    	{
    		return null;
    	}
    }
    
	/*
	 * public void deleteDojo (Long id) { Optional<Dojo> optionalDojo =
	 * dojoRepository.findById(id); if (optionalDojo.isPresent()) {
	 * optionalDojo.deletebyId(id); } }
	 */
}
