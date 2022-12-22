package com.kendelltaylor.hmcalc.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kendelltaylor.hmcalc.models.Attribute;

@Repository
public interface AttributeRepository extends CrudRepository<Attribute, Long> {
	List<Attribute> findAll();
	Optional<Attribute> findByAttributeName(String attributeName);
}
