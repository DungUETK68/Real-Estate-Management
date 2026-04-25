package com.javaweb.api.admin;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.impl.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("admin/customer")
public class CustomerAPI {

    @Autowired
    private IBuildingService buildingService;

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO responseDTO = buildingService.listStaffs(id);
        return responseDTO;
    }

    @PostMapping
    public void addOrUpdateCustomer(@RequestBody CustomerDTO customer) {
        System.out.println("ok");
    }

    @PostMapping("/transaction")
    public void addOrUpdateTransaction(@RequestBody TransactionEntity transaction) {
        System.out.println("ok");
    }
}
