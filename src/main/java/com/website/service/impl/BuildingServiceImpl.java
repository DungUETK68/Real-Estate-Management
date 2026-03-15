package com.website.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.model.BuildingDTO;
import com.website.repository.BuildingRepository;
import com.website.repository.entity.BuildingEntity;
import com.website.service.BuildingService;

@Service
public class BuildingServiceImpl implements BuildingService {
	
	@Autowired
	private BuildingRepository buildingRepository;

	@Override
	public List<BuildingDTO> findAll(String name, Long districtId) {
		List<BuildingEntity> buildingEntities = buildingRepository.findAll(name, districtId);
		List<BuildingDTO> result = new ArrayList<BuildingDTO>();
		
		for (BuildingEntity item : buildingEntities) {
			BuildingDTO building = new BuildingDTO();
			building.setName(item.getName());
			building.setAddress(item.getStreet() + ", " + item.getWard());
			building.setNumberOfBasement(item.getNumberOfBasement());
			
			result.add(building);
		}
		
		return result;
	}
}
