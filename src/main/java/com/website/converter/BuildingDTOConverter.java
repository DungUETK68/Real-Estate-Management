package com.website.converter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.website.model.BuildingDTO;
import com.website.repository.DistrictRepository;
import com.website.repository.entity.BuildingEntity;
import com.website.repository.entity.DistrictEntity;

@Component
public class BuildingDTOConverter {
	@Autowired
	private DistrictRepository districtRepository;
	
	public BuildingDTO toBuildingDTO(BuildingEntity buildingEntity) {
		BuildingDTO building = new BuildingDTO();
		building.setName(buildingEntity.getName());
		DistrictEntity districtEntity = districtRepository.getNameById(buildingEntity.getDistrictId()); 
		building.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + districtEntity.getName());
		building.setNumberOfBasement(buildingEntity.getNumberOfBasement());
		building.setManagerName(buildingEntity.getManagerName());
		building.setManagerPhoneNumber(buildingEntity.getManagerPhoneNumber());
		building.setFloorArea(buildingEntity.getFloorArea());
		building.setEmptyArea(buildingEntity.getEmptyArea());
		building.setRentArea(buildingEntity.getRentArea());
		building.setRentPrice(buildingEntity.getRentPrice());
		building.setServiceFee(buildingEntity.getServiceFee());
		building.setBrokerageFee(buildingEntity.getBrokerageFee());
		
		return building;
	}
}
