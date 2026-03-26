package com.website.repository.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.website.builder.BuildingSearchBuilder;
import com.website.repository.BuildingRepository;
import com.website.repository.entity.BuildingEntity;
import com.website.utils.ConnectionJDBCUtil;

@Repository
public class JDBCBuildingRepositoryImpl implements BuildingRepository {
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
		
		Object rentArea1 = buildingSearchBuilder.getRentArea1();
		Object rentArea2 = buildingSearchBuilder.getRentArea2();
		if (buildingSearchBuilder.getRentArea1() != null) {
			rentArea1 = buildingSearchBuilder.getRentArea1().toString();
		}
		if (buildingSearchBuilder.getRentArea2() != null) {
			rentArea2 = buildingSearchBuilder.getRentArea2().toString();
		}
	    if(rentArea1 != null && !rentArea1.equals("")) {
	    	where.append("AND rentarea.value >= ").append(rentArea1).append(" ");
	    }
	    if(rentArea2 != null && !rentArea2.equals("")) {
	    	where.append("AND rentarea.value <= ").append(rentArea2).append(" ");
	    }
	    
	    Object staffId = buildingSearchBuilder.getStaffId();
		if (staffId != null) {
			staffId = buildingSearchBuilder.getStaffId().toString();
		}
	    if (staffId != null && !staffId.equals("")) {
	    	where.append("AND assignmentbuilding.staffid = ").append(staffId).append(" ");
	    }
	}

	@Override
	public List<BuildingEntity> findAll(BuildingSearchBuilder buildingSearchBuilder) {
		StringBuilder sql = new StringBuilder("SELECT b.id, b.name, b.numberofbasement, b.ward, b.street, b.direction, b.level, "
	            + "b.managername, b.managerphonenumber, b.floorarea, b.districtid, b.rentprice, "
	            + "b.servicefee, b.brokeragefee, "
	            + "(SELECT GROUP_CONCAT(ra.value) FROM rentarea ra WHERE ra.buildingid = b.id) as rentarea "
	            + "FROM building b ");
		joinTable(buildingSearchBuilder, sql);
		StringBuilder where = new StringBuilder("WHERE 1 = 1 ");
		query(buildingSearchBuilder, where);
		sql.append(where);
		sql.append(" GROUP BY b.id");
		System.out.print(sql);
		
		List<BuildingEntity> result = new ArrayList<>();
		try(Connection conn = ConnectionJDBCUtil.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql.toString());) {
			
			while (rs.next()) {
				BuildingEntity building = new BuildingEntity();
				building.setName(rs.getString("name"));
				building.setNumberOfBasement(rs.getString("numberofbasement"));
				building.setWard(rs.getString("ward"));
				building.setStreet(rs.getString("street"));
				building.setManagerName(rs.getString("managername"));
				building.setManagerPhoneNumber(rs.getString("managerphonenumber"));
				building.setFloorArea(rs.getLong("floorarea"));
				building.setRentPrice(rs.getLong("rentprice"));
				building.setServiceFee(rs.getDouble("servicefee"));
				building.setBrokerageFee(rs.getDouble("brokeragefee"));
				result.add(building);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.print("Loi ket noi Database");
		}
		
		return result;
	}
}
