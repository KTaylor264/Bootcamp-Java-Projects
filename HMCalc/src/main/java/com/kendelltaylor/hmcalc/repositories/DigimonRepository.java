package com.kendelltaylor.hmcalc.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kendelltaylor.hmcalc.models.Digimon;

@Repository
public interface DigimonRepository extends CrudRepository<Digimon, Long> {
	List<Digimon> findAll();
	List<Digimon> findDigimonByDiginameContaining(String search);
}
