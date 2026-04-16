package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.enums.District;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.IBuildingService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class BuildingService implements IBuildingService {
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Override
    public ResponseDTO listStaffs(Long buildingId) {
        BuildingEntity buildingEntity = buildingRepository.findById(buildingId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = buildingEntity.getUserEntities();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for(UserEntity item : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(item.getFullName());
            staffResponseDTO.setStaffId(item.getId());
            if (staffAssignment.contains(item)) {
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable  pageable) {
        List<BuildingEntity> entities = buildingRepository.findBuildings(buildingSearchRequest, pageable);
        List<BuildingSearchResponse> responses = new ArrayList<>();

        Map<String, String> districtsMap = District.listDistricts();

        for(BuildingEntity item : entities) {
            BuildingSearchResponse buildingSearchResponse = modelMapper.map(item, BuildingSearchResponse.class);

            String districtName = "";
            if (item.getDistrict() != null && !item.getDistrict().isEmpty()) {
                if (districtsMap.containsKey(item.getDistrict())) {
                    districtName = districtsMap.get(item.getDistrict());
                } else {
                    districtName = item.getDistrict();
                }
            }
            buildingSearchResponse.setAddress(item.getStreet() + ", " + item.getWard() + ", " + districtName);

            if (item.getItems() != null && !item.getItems().isEmpty()) {
                String rentAreaString = item.getItems().stream()
                        .map(r -> r.getValue())
                        .filter(val -> val != null && !val.isEmpty())
                        .collect(Collectors.joining(", "));
                buildingSearchResponse.setRentArea(rentAreaString);
            }

            if (item.getFloorArea() != null) {
                buildingSearchResponse.setEmptyArea(String.valueOf(item.getFloorArea()));
            } else {
                buildingSearchResponse.setEmptyArea("");
            }

            responses.add(buildingSearchResponse);
        }

        return responses;
    }

    @Override
    public int countTotalItems(BuildingSearchRequest buildingSearchRequest) {
        return buildingRepository.countTotalItem(buildingSearchRequest);
    }

    @Override
    @Transactional
    public BuildingDTO findById(Long id) {
        BuildingEntity entity = buildingRepository.findById(id).get();
        BuildingDTO dto = modelMapper.map(entity, BuildingDTO.class);

        if (entity.getTypeCode() != null) {
            dto.setTypeCode(Arrays.asList(entity.getTypeCode().split(",")));
        }

        if (entity.getItems() != null && !entity.getItems().isEmpty()) {
            String rentAreaString = entity.getItems().stream()
                    .map(r -> r.getValue())
                    .collect(Collectors.joining(", "));
            dto.setRentArea(rentAreaString);
        }
        return dto;
    }

    @Override
    @Transactional
    public void save(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = modelMapper.map(buildingDTO, BuildingEntity.class);

        if (buildingDTO.getTypeCode() != null) {
            buildingEntity.setTypeCode(String.join(",", buildingDTO.getTypeCode()));
        }

        if (buildingDTO.getId() != null) {
            BuildingEntity oldBuilding = buildingRepository.findById(buildingDTO.getId()).get();
            rentAreaRepository.deleteAllByBuildingId(buildingDTO.getId());
        }

        BuildingEntity savedBuilding = buildingRepository.save(buildingEntity);

        if (buildingDTO.getRentArea() != null && !buildingDTO.getRentArea().trim().isEmpty()) {
            String[] areas = buildingDTO.getRentArea().split(",");
            for (String area : areas) {
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setValue(area.trim());
                rentAreaEntity.setBuilding(savedBuilding);
                rentAreaRepository.save(rentAreaEntity);
            }
        }
    }

    @Override
    @Transactional
    public void delete(List<Long> ids) {
        for(Long id : ids) {
            rentAreaRepository.deleteAllByBuildingId(id);
            buildingRepository.deleteById(id);
        }
    }
}
