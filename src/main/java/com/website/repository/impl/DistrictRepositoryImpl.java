package com.website.repository.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.website.repository.DistrictRepository;
import com.website.repository.entity.BuildingEntity;
import com.website.repository.entity.DistrictEntity;

@Service
public class DistrictRepositoryImpl implements DistrictRepository {
	static final String DB_URL = "jdbc:mysql://localhost:3306/estatebasic";
	static final String USER = "root";
	static final String PASS = "123456";

	@Override
	public DistrictEntity getNameById(Long id) {
		String sql = "SELECT d.name FROM district d WHERE d.id = " + id + ";";
		
		DistrictEntity districtEntity = new DistrictEntity();
		try(Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql.toString());) {
			
			while (rs.next()) {
				districtEntity.setName(rs.getString("name"));
			}
	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return districtEntity;
	}
	
}
