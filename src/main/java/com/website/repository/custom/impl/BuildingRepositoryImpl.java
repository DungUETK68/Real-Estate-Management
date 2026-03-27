package com.website.repository.custom.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Repository;

import com.website.builder.BuildingSearchBuilder;
import com.website.repository.BuildingRepository;
import com.website.repository.entity.BuildingEntity;

@Repository
@Primary
public class BuildingRepositoryImpl {

	@PersistenceContext
	private EntityManager entityManager;
	
	public List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder) {
		// TODO Auto-generated method stub
		//Sql Native
		String sql = "SELECT * FROM building b WHERE b.name like '%building%' ";
		Query query = entityManager.createNativeQuery(sql, BuildingEntity.class);
		return query.getResultList();
	}
}
