package com.website.service;

import java.util.List;
import java.util.Map;

import com.website.model.BuildingDTO;

public interface BuildingService {
	List<BuildingDTO> findAll(Map<String, Object> params, List<String> typeCode);
}
