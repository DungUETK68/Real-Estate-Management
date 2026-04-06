package com.javaweb.api.admin;

import com.javaweb.model.dto.BuildingDTO;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/building")
public class BuildingAPI {

    @PostMapping
    public BuildingDTO addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO) {
        //TODO: Xuong DB de them du lieu
        return buildingDTO;
    }

    @DeleteMapping("/{ids}")
    public void deleteBuilding(@RequestBody List<Long> ids){
        //TODO:Xuong DB de xoa theo danh sach id
        System.out.println("OK");
    }
}
