package com.website.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.website.repository.entity.BuildingEntity;

public interface BuildingRepository extends JpaRepository<BuildingEntity, Long> {
	void deleteByIdIn(Long[] ids);
	List<BuildingEntity> findByNameContaining(String name);
	List<BuildingEntity> findByNameContainingAndStreet(String name, String street);
}
