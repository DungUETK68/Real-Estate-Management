package com.website.repository.custom;

import java.util.List;

import com.website.builder.BuildingSearchBuilder;
import com.website.repository.entity.BuildingEntity;

public interface BuildingRepositoryCustom {
	List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder);
}
