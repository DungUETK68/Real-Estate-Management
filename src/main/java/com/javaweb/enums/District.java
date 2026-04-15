package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum District {
    QUAN_1("Quận 1"),
    QUAN_2("Quận 2"),
    QUAN_3("Quận 3");

    private final String districtName;

    District(String districtName) {
        this.districtName = districtName;
    }

    public static Map<String, String> listDistricts() {
        Map<String, String> districts = new TreeMap<>();
        for (District district : District.values()) {
            districts.put(district.toString(), district.districtName);
        }
        return districts;
    }
}
