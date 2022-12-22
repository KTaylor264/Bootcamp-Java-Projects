package com.kendelltaylor.hmcalc.repositories;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kendelltaylor.hmcalc.models.SupportSkill;

@Repository
public interface SupportSkillRepository extends CrudRepository<SupportSkill, Long> {
	List<SupportSkill> findAll();
	Optional<SupportSkill> findBySkillName(String supportSkillName);
}
