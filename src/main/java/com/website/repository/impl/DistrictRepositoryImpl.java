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
import com.website.utils.ConnectionJDBCUtil;

@Service
public class DistrictRepositoryImpl implements DistrictRepository {
	@Override
	public DistrictEntity getNameById(Long id) {
		String sql = "SELECT d.name FROM district d WHERE d.id = " + id + ";";
		
		DistrictEntity districtEntity = new DistrictEntity();
		try(Connection conn = ConnectionJDBCUtil.getConnection();
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
