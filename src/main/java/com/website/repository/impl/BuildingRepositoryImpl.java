package com.website.repository.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.website.repository.BuildingRepository;
import com.website.repository.entity.BuildingEntity;

@Repository
public class BuildingRepositoryImpl implements BuildingRepository {
	static final String DB_URL = "jdbc:mysql://localhost:3306/estatebasic";
	static final String USER = "root";
	static final String PASS = "123456";

	@Override
	public List<BuildingEntity> findAll(String name, Long districtId) {
		StringBuilder sql = new StringBuilder("SELECT * FROM building b WHERE 1 = 1 ");
		
		if(name != null && name != "") {
			sql.append("AND b.name like '%" + name + "%' ");
		}
		if(districtId != null) {
			sql.append("AND b.districtid = " + districtId + " ");
		}
		
		List<BuildingEntity> result = new ArrayList<>();
		try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql.toString());) {
			
			while (rs.next()) {
				BuildingEntity building = new BuildingEntity();
				building.setName(rs.getString("name"));
				building.setNumberOfBasement(rs.getString("numberofbasement"));
				building.setWard(rs.getString("ward"));
				building.setStreet(rs.getString("street"));
				result.add(building);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.print("Loi ket noi Database");
		}
		
		return result;
	}
}
