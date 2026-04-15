package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.data.domain.Pageable;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

public class BuildingRepositoryImpl implements BuildingRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    public void joinTable(BuildingSearchRequest request, StringBuilder sql) {
        Long staffId = request.getStaffId();
        if (staffId != null) {
            sql.append(" INNER JOIN assignmentbuilding ab ON b.id = ab.buildingid ");
        }
        if (request.getAreaFrom() != null || request.getAreaTo() != null) {
            sql.append(" INNER JOIN rentarea ra ON b.id = ra.buildingid ");
        }
    }

    public void queryNormal(BuildingSearchRequest request, StringBuilder where) {
        try {
            // Lấy toàn bộ các trường trong class BuildingSearchRequest
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();
            for (Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName();

                // Bỏ qua các trường ĐẶC BIỆT (sẽ xử lý riêng)
                if (!fieldName.equals("staffId") && !fieldName.equals("typeCode") &&
                        !fieldName.startsWith("area") && !fieldName.startsWith("rentPrice")) {

                    Object value = item.get(request); // Lấy giá trị người dùng nhập

                    if (value != null && !value.toString().equals("")) {
                        if (item.getType().getName().equals("java.lang.Long") || item.getType().getName().equals("java.lang.Integer")) {
                            where.append(" AND b.").append(fieldName.toLowerCase()).append(" = ").append(value).append(" ");
                        } else if (item.getType().getName().equals("java.lang.String")) {
                            where.append(" AND b.").append(fieldName.toLowerCase()).append(" LIKE '%").append(value).append("%' ");
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void querySpecial(BuildingSearchRequest request, StringBuilder where) {
        Long staffId = request.getStaffId();
        if (staffId != null) {
            where.append(" AND ab.staffid = ").append(staffId).append(" ");
        }
        if (request.getAreaFrom() != null) {
            where.append(" AND b.floorarea >= ").append(request.getAreaFrom()).append(" ");
        }
        if (request.getAreaTo() != null) {
            where.append(" AND b.floorarea <= ").append(request.getAreaTo()).append(" ");
        }
        if (request.getRentPriceFrom() != null) {
            where.append(" AND b.rentprice >= ").append(request.getRentPriceFrom()).append(" ");
        }
        if (request.getRentPriceTo() != null) {
            where.append(" AND b.rentprice <= ").append(request.getRentPriceTo()).append(" ");
        }
        List<String> typeCode = request.getTypeCode();
        if (typeCode != null && !typeCode.isEmpty()) {
            where.append(" AND (");
            // Dùng stream để nối mảng: b.type LIKE '%TANG_TRET%' OR b.type LIKE '%NGUYEN_CAN%'
            String sqlJoin = typeCode.stream()
                    .map(item -> "b.type LIKE '%" + item + "%'")
                    .collect(Collectors.joining(" OR "));
            where.append(sqlJoin).append(") ");
        }
    }


    @Override
    public List<BuildingEntity> findBuildings(BuildingSearchRequest request, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b ");
        joinTable(request, sql);

        StringBuilder where = new StringBuilder(" WHERE 1=1 ");
        queryNormal(request, where);
        querySpecial(request, where);

        sql.append(where).append("GROUP BY b.id");

        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);

        if (pageable != null) {
            query.setFirstResult((int) pageable.getOffset());
            query.setMaxResults(pageable.getPageSize());
        }

        return query.getResultList();
    }

    @Override
    public int countTotalItem(BuildingSearchRequest request) {
        StringBuilder sql = new StringBuilder("SELECT COUNT(DISTINCT b.id) FROM building b ");
        joinTable(request, sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ");
        queryNormal(request, where);
        querySpecial(request, where);
        sql.append(where);

        Query query = entityManager.createNativeQuery(sql.toString());
        return ((Number) query.getSingleResult()).intValue();
    }
}
