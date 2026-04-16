package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("admin/building")
public class BuildingAPI {

    @Autowired
    private IBuildingService buildingService;

    @PostMapping
    public void addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
        buildingService.save(buildingDTO);
    }

    @DeleteMapping
    public void deleteBuilding(@RequestBody List<Long> ids){
        buildingService.delete(ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO responseDTO = buildingService.listStaffs(id);
        return responseDTO;
    }

    @PostMapping("/assignment")
    public void updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        buildingService.updateAssignmentBuilding(assignmentBuildingDTO);
    }
}
