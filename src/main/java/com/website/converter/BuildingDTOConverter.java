package com.website.converter;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.website.model.BuildingDTO;
import com.website.repository.entity.BuildingEntity;

@Component
public class BuildingDTOConverter {
	
	@Autowired
	private ModelMapper modelMapper;
	
	public BuildingDTO toBuildingDTO(BuildingEntity buildingEntity) {
		BuildingDTO building = modelMapper.map(buildingEntity, BuildingDTO.class);
//		DistrictEntity districtEntity = buildingEntity.getDistrict();
		building.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + buildingEntity.getDistrict().getName());
		
		return building;
	}
}
