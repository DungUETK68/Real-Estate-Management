package com.website.repository;

import java.util.List;

import com.website.repository.entity.BuildingEntity;

public interface BuildingRepository {
	List<BuildingEntity> findAll(String name, Long districtId);
}
