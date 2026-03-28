package com.website.repository.custom.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.stereotype.Repository;

import com.website.builder.BuildingSearchBuilder;
import com.website.repository.custom.BuildingRepositoryCustom;
import com.website.repository.entity.BuildingEntity;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	public static void joinTable(BuildingSearchBuilder buildingSearchBuilder, StringBuilder sql) {
		List<String> typeCode = buildingSearchBuilder.getTypeCode();
		if (typeCode != null && !typeCode.isEmpty()) {
			sql.append("INNER JOIN buildingrenttype ON b.id = buildingrenttype.buildingid ");
			sql.append("INNER JOIN renttype ON buildingrenttype.renttypeid = renttype.id ");
		}
		
		Object rentArea1 = buildingSearchBuilder.getRentArea1();
		Object rentArea2 = buildingSearchBuilder.getRentArea2();
		if (buildingSearchBuilder.getRentArea1() != null) {
			rentArea1 = buildingSearchBuilder.getRentArea1().toString();
		}
		if (buildingSearchBuilder.getRentArea2() != null) {
			rentArea2 = buildingSearchBuilder.getRentArea2().toString();
		}
		if((rentArea1 != null && !rentArea1.equals("")) || (rentArea2 != null && !rentArea2.equals(""))) {
			sql.append("INNER JOIN rentarea ON b.id = rentarea.buildingid ");
		}
		
		Object staffId = buildingSearchBuilder.getStaffId();
		if (staffId != null) {
			staffId = buildingSearchBuilder.getStaffId().toString();
		}
		if(staffId != null && !staffId.equals("")) {
			sql.append("INNER JOIN assignmentbuilding ON b.id = assignmentbuilding.buildingid ");
		}
	}
	
	public static void query(BuildingSearchBuilder buildingSearchBuilder, StringBuilder where) {
		List<String> typeCode = buildingSearchBuilder.getTypeCode();
		if (typeCode != null && !typeCode.isEmpty()) {
	        where.append("AND renttype.code IN (");
	        for (int i = 0; i < typeCode.size(); i++) {
	            where.append("'").append(typeCode.get(i)).append("'");
	            if (i < typeCode.size() - 1) {
	                where.append(", ");
	            }
	        }
	        where.append(") ");
	    }
		
		if (buildingSearchBuilder.getName() != null && !buildingSearchBuilder.getName().trim().isEmpty()) {
	        where.append("AND b.name LIKE '%").append(buildingSearchBuilder.getName()).append("%' ");
	    }
	    if (buildingSearchBuilder.getDistrictId() != null && !buildingSearchBuilder.getDistrictId().trim().isEmpty()) {
	        where.append("AND b.districtid = ").append(buildingSearchBuilder.getDistrictId()).append(" ");
	    }
	    if (buildingSearchBuilder.getWard() != null && !buildingSearchBuilder.getWard().trim().isEmpty()) {
	        where.append("AND b.ward LIKE '%").append(buildingSearchBuilder.getWard()).append("%' ");
	    }
	    if (buildingSearchBuilder.getStreet() != null && !buildingSearchBuilder.getStreet().trim().isEmpty()) {
	        where.append("AND b.street LIKE '%").append(buildingSearchBuilder.getStreet()).append("%' ");
	    }
	    if (buildingSearchBuilder.getNumberOfBasement() != null) {
	        where.append("AND b.numberofbasement = ").append(buildingSearchBuilder.getNumberOfBasement()).append(" ");
	    }
	    if (buildingSearchBuilder.getManagerName() != null && !buildingSearchBuilder.getManagerName().trim().isEmpty()) {
	        where.append("AND b.managername LIKE '%").append(buildingSearchBuilder.getManagerName()).append("%' ");
	    }
	    if (buildingSearchBuilder.getManagerPhoneNumber() != null && !buildingSearchBuilder.getManagerPhoneNumber().trim().isEmpty()) {
	        where.append("AND b.managerphonenumber LIKE '%").append(buildingSearchBuilder.getManagerPhoneNumber()).append("%' ");
	    }
		

	    if(buildingSearchBuilder.getRentArea1() != null) {
	    	where.append("AND rentarea.value >= ").append(buildingSearchBuilder.getRentArea1()).append(" ");
	    }
	    if(buildingSearchBuilder.getRentArea2() != null) {
	    	where.append("AND rentarea.value <= ").append(buildingSearchBuilder.getRentArea2()).append(" ");
	    }
	    
	    if (buildingSearchBuilder.getRentPrice1() != null) {
	        where.append("AND b.rentprice >= ").append(buildingSearchBuilder.getRentPrice1()).append(" ");
	    }
	    if (buildingSearchBuilder.getRentPrice2() != null) {
	        where.append("AND b.rentprice <= ").append(buildingSearchBuilder.getRentPrice2()).append(" ");
	    }
	    
	    Object staffId = buildingSearchBuilder.getStaffId();
		if (staffId != null) {
			staffId = buildingSearchBuilder.getStaffId().toString();
		}
	    if (staffId != null && !staffId.equals("")) {
	    	where.append("AND assignmentbuilding.staffid = ").append(staffId).append(" ");
	    }
	}

	public List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder) {
		StringBuilder sql = new StringBuilder("SELECT b.* FROM building b ");
		joinTable(buildingSearchBuilder, sql);
		StringBuilder where = new StringBuilder("WHERE 1 = 1 ");
		query(buildingSearchBuilder, where);
		sql.append(where);
		sql.append(" GROUP BY b.id");
		
		Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
		return query.getResultList();
	}
}
