package com.website.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.website.repository.entity.DistrictEntity;

public interface DistrictRepository extends JpaRepository<DistrictEntity, Long>{
	DistrictEntity findNameById(Long id);
}
