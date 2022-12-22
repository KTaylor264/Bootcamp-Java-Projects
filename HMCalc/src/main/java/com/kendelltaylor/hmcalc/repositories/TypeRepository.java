package com.kendelltaylor.hmcalc.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kendelltaylor.hmcalc.models.Type;

@Repository
public interface TypeRepository extends CrudRepository<Type, Long> {
	List<Type> findAll();
	Optional<Type> findByTypeName(String typeName);
}
