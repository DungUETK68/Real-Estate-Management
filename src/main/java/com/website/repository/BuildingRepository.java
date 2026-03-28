package com.website.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.website.repository.custom.BuildingRepositoryCustom;
import com.website.repository.entity.BuildingEntity;

public interface BuildingRepository extends JpaRepository<BuildingEntity, Long>, BuildingRepositoryCustom {
	void deleteByIdIn(Long[] ids);
	List<BuildingEntity> findByNameContaining(String name);
	List<BuildingEntity> findByNameContainingAndStreet(String name, String street);
}
