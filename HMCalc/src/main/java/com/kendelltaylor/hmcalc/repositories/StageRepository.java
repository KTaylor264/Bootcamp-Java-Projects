package com.kendelltaylor.hmcalc.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kendelltaylor.hmcalc.models.Stage;

@Repository
public interface StageRepository extends CrudRepository<Stage, Long> {
	List<Stage> findAll();
	Optional<Stage> findByStageName(String stageName);
}
