package com.kendelltaylor.burgertracker.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kendelltaylor.burgertracker.models.Burger;

@Repository
public interface BurgerRepository extends CrudRepository <Burger, Long>{
	// this method retrieves all the burgers from the database
    List<Burger> findAll();
//    // this method finds burger names with descriptions containing the search string
//    List<Burger> findByBurgerNameContaining(String search);
//    // this method deletes a burger that starts with a specific burgerName
//    Long deleteByBurgerNameStartingWith(String search);
}
