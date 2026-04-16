package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IBuildingService {
    ResponseDTO listStaffs(Long buildingId);
    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    int countTotalItems(BuildingSearchRequest buildingSearchRequest);
    BuildingDTO findById(Long id);
    void save(BuildingDTO buildingDTO);
    void delete(List<Long> ids);
    void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
}
