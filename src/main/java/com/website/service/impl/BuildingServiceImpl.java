package com.website.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.model.BuildingDTO;
import com.website.repository.BuildingRepository;
import com.website.repository.DistrictRepository;
import com.website.repository.entity.BuildingEntity;
import com.website.repository.entity.DistrictEntity;
import com.website.service.BuildingService;

@Service
public class BuildingServiceImpl implements BuildingService {
	
	@Autowired
	private BuildingRepository buildingRepository;
	
	@Autowired
	private DistrictRepository districtRepository;

	@Override
	public List<BuildingDTO> findAll(Map<String, Object> params, List<String> typeCode) {
		List<BuildingEntity> buildingEntities = buildingRepository.findAll(params, typeCode);
		List<BuildingDTO> result = new ArrayList<BuildingDTO>();
		
		for (BuildingEntity item : buildingEntities) {
			BuildingDTO building = new BuildingDTO();
			building.setName(item.getName());
			DistrictEntity districtEntity = districtRepository.getNameById(item.getDistrictId()); 
			building.setAddress(item.getStreet() + ", " + item.getWard() + ", " + districtEntity.getName());
			building.setNumberOfBasement(item.getNumberOfBasement());
			building.setManagerName(item.getManagerName());
			building.setManagerPhoneNumber(item.getManagerPhoneNumber());
			building.setFloorArea(item.getFloorArea());
			building.setEmptyArea(item.getEmptyArea());
			building.setRentArea(item.getRentArea());
			building.setRentPrice(item.getRentPrice());
			building.setServiceFee(item.getServiceFee());
			building.setBrokerageFee(item.getBrokerageFee());
			result.add(building);
		}
		
		return result;
	}
}
