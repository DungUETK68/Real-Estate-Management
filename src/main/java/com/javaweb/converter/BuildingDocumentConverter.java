package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.elasticsearch.BuildingDocument;
import com.javaweb.enums.District;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
public class BuildingDocumentConverter {

    public BuildingDocument toDocument(BuildingEntity entity) {
        BuildingDocument document = new BuildingDocument();
        document.setId(entity.getId());
        document.setName(entity.getName());
        
        Map<String, String> districtsMap = District.listDistricts();
        String districtName = districtsMap.getOrDefault(entity.getDistrict(), entity.getDistrict());
        String fullAddress = entity.getStreet() + ", " + entity.getWard() + ", " + districtName;
        document.setAddress(fullAddress);
        
        if (entity.getRentPrice() != null) {
            document.setRentPrice(entity.getRentPrice().doubleValue());
        }
        
        document.setManagerName(entity.getManagerName());
        document.setManagerPhone(entity.getManagerPhone());
        
        return document;
    }
}
