package com.kendelltaylor.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kendelltaylor.dojosandninjas.models.Ninja;
import com.kendelltaylor.dojosandninjas.repositories.NinjaRepository;

@Service
public class NinjaService {
	private final NinjaRepository ninjaRepository;
	
	public NinjaService (NinjaRepository ninjaRepository)
	{
		this.ninjaRepository = ninjaRepository;
	}
	
	public List<Ninja> allNinjas ()
	{
		return ninjaRepository.findAll();
	}
	
	public Ninja createNinja (Ninja n)
	{
		return ninjaRepository.save(n);
	}
	
	public Ninja findNinja (Long id)
    {
        Optional<Ninja> optionalNinja = ninjaRepository.findById(id);
        if (optionalNinja.isPresent())
        {
            return optionalNinja.get();
        }
        else
        {
            return null;
        }
    }
    
    public Ninja updateNinja (Long id, String firstName, String lastName, int age)
    {
    	Optional<Ninja> optionalNinja = ninjaRepository.findById(id);
    	if (optionalNinja.isPresent())
    	{
    		optionalNinja.get().setFirstName(firstName);
    		optionalNinja.get().setLastName(lastName);
    		optionalNinja.get().setAge(age);
    		
    		return ninjaRepository.save(optionalNinja.get());
    	}
    	else
    	{
    		return null;
    	}
    }
    
    public Ninja updateNinja (Ninja ninja)
    {
    	Optional<Ninja> optionalNinja = ninjaRepository.findById(ninja.getId());
    	if (optionalNinja.isPresent())
    	{
    		optionalNinja.get().setFirstName(ninja.getFirstName());
    		optionalNinja.get().setLastName(ninja.getLastName());
    		optionalNinja.get().setAge(ninja.getAge());
    		
    		return ninjaRepository.save(optionalNinja.get());
    		
    	}
    	else
    	{
    		return null;
    	}
    }
    
	/*
	 * public void deleteNinja (Long id) { Optional<Ninja> optionalNinja =
	 * ninjaRepository.findById(id); if (optionalNinja.isPresent()) {
	 * optionalNinja.deleteById(id); } }
	 */
}
