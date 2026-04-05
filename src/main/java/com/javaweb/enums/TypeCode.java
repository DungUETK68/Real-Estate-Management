package com.javaweb.enums;

import java.util.Map;
import java.util.TreeMap;

public enum TypeCode {
    NOI_THAT("Nội thất"),
    NGUYEN_CAN("Nguyên căn"),
    TANG_TRET("Tầng trệt");

    private final String typeName;

    TypeCode(String typeName) {
        this.typeName = typeName;
    }

    public static Map<String, String> listTypes() {
        Map<String, String> types = new TreeMap<>();
        for (TypeCode typeCode : TypeCode.values()) {
            types.put(typeCode.toString(), typeCode.typeName);
        }
        return types;
    }
}
