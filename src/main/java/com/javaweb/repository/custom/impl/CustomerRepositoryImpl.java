package com.javaweb.repository.custom.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Collections;
import java.util.List;

@Repository
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {

    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<CustomerEntity> findCustomers(CustomerSearchRequest request) {
        StringBuilder sql = new StringBuilder("SELECT c.* FROM customer c ");

        if (request.getStaffId() != null) {
            sql.append(" JOIN assignmentcustomer ac ON c.id = ac.customerid ");
        }

        sql.append(" WHERE 1=1 ");

        if (StringUtils.isNotBlank(request.getFullName())) {
            sql.append(" AND c.fullname LIKE '%").append(request.getFullName()).append("%' ");
        }
        if (StringUtils.isNotBlank(request.getPhone())) {
            sql.append(" AND c.phone LIKE '%").append(request.getPhone()).append("%' ");
        }
        if (StringUtils.isNotBlank(request.getEmail())) {
            sql.append(" AND c.email LIKE '%").append(request.getEmail()).append("%' ");
        }

        if (request.getStaffId() != null) {
            sql.append(" AND ac.staffid = ").append(request.getStaffId());
        }

        sql.append(" GROUP BY c.id ");

        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }
}
