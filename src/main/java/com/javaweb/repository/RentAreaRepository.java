package com.javaweb.repository;

import com.javaweb.entity.RentAreaEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.transaction.annotation.Transactional;

public interface RentAreaRepository extends JpaRepository<RentAreaEntity, Long> {
    @Modifying
    @Transactional
    void deleteAllByBuildingId(Long buildingId);
}
