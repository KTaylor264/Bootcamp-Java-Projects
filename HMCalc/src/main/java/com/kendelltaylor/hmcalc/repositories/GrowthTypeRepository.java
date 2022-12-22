package com.kendelltaylor.hmcalc.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kendelltaylor.hmcalc.models.GrowthType;

@Repository
public interface GrowthTypeRepository extends CrudRepository<GrowthType, Long> {
	List<GrowthType> findAll();
	Optional<GrowthType> findByGrowthTypeName(String growthTypeName);
}
