package com.website.converter;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.website.builder.BuildingSearchBuilder;
import com.website.utils.MapUtil;

@Component
public class BuildingSearchBuilderConverter {
	public BuildingSearchBuilder toBuildingSearchBuilder(Map<String, Object> params, List<String> typeCode) {
		BuildingSearchBuilder buildingSearchBuilder = new BuildingSearchBuilder.Builder().setName(MapUtil.getObject(params, "name", String.class))
																						.setFloorArea(MapUtil.getObject(params, "floorArea", Long.class))
																						.setWard(MapUtil.getObject(params, "ward", String.class))
																						.setStreet(MapUtil.getObject(params, "street", String.class))
																						.setDistrictId(MapUtil.getObject(params, "districtId", String.class))
																						.setNumberOfBasement(MapUtil.getObject(params, "numberOfBasement", Integer.class))
																						.setTypeCode(typeCode)
																						.setManagerName(MapUtil.getObject(params, "managerName", String.class))
																						.setManagerPhoneNumber(MapUtil.getObject(params, "managerPhoneNumber", String.class))
																						.setRentPrice1(MapUtil.getObject(params, "rentPrice1", Long.class))
																						.setRentPrice2(MapUtil.getObject(params, "rentPrice2", Long.class))
																						.setRentArea1(MapUtil.getObject(params, "rentArea1", Long.class))
																						.setRentArea2(MapUtil.getObject(params, "rentArea2", Long.class))
																						.setStaffId(MapUtil.getObject(params, "staffId", Long.class))
																						.build();
		return buildingSearchBuilder;
	}
}
