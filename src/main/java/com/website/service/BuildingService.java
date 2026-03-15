package com.website.service;

import java.util.List;

import com.website.model.BuildingDTO;

public interface BuildingService {
	List<BuildingDTO> findAll(String name, Long districtId);
}
