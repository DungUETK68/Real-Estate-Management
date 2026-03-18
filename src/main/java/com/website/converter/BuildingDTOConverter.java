package com.website.converter;

import org.modelmapper.ModelMapper;
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
	
	@Autowired
	private ModelMapper modelMapper;
	
	public BuildingDTO toBuildingDTO(BuildingEntity buildingEntity) {
		BuildingDTO building = modelMapper.map(buildingEntity, BuildingDTO.class);
		DistrictEntity districtEntity = districtRepository.getNameById(buildingEntity.getDistrictId()); 
		building.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + districtEntity.getName());
		
		return building;
	}
}
