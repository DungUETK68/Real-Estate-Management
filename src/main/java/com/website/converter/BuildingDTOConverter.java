package com.website.converter;

import java.util.List;
import java.util.stream.Collectors;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.website.model.BuildingDTO;
import com.website.repository.entity.BuildingEntity;
import com.website.repository.entity.RentAreaEntity;

@Component
public class BuildingDTOConverter {
	
	@Autowired
	private ModelMapper modelMapper;
	
	public BuildingDTO toBuildingDTO(BuildingEntity buildingEntity) {
		BuildingDTO building = modelMapper.map(buildingEntity, BuildingDTO.class);
		building.setAddress(buildingEntity.getStreet() + ", " + buildingEntity.getWard() + ", " + buildingEntity.getDistrict().getName());
		
		List<RentAreaEntity> rentAreas = buildingEntity.getItems();
		if (rentAreas != null && !rentAreas.isEmpty()) {
			String rentAreaStr = rentAreas.stream()
										  .map(item -> item.getValue().toString())
										  .collect(Collectors.joining(", "));
			building.setRentArea(rentAreaStr);
		}
		
		return building;
	}
}
