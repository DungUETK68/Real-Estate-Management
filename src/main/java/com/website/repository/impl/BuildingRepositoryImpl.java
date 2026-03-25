package com.website.repository.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.website.builder.BuildingSearchBuilder;
import com.website.repository.BuildingRepository;
import com.website.repository.entity.BuildingEntity;

public class BuildingRepositoryImpl implements BuildingRepository {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder) {
		// TODO Auto-generated method stub
		String sql = "FROM BuildingEntity";
		Query query = entityManager.createQuery(sql, BuildingEntity.class);
		return query.getResultList();
	}

}
