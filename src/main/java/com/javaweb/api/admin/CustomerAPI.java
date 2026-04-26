package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.service.IBuildingService;
import com.javaweb.service.impl.CustomerService;
import com.javaweb.service.impl.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("admin/customer")
public class CustomerAPI {

    @Autowired
    private IBuildingService buildingService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private TransactionService transactionService;

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id) {
        ResponseDTO responseDTO = customerService.listStaffs(id);
        return responseDTO;
    }

    @PostMapping
    public void addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO) {
        customerService.save(customerDTO);
    }

    @PostMapping("/assignment")
    public void updateAssignmentCustomer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO){
        customerService.updateAssignmentCustomer(assignmentCustomerDTO);
    }

    @PostMapping("/transaction")
    public void addOrUpdateTransaction(@RequestBody TransactionDTO transactionDTO) {
        transactionService.save(transactionDTO);
    }

    @DeleteMapping
    public void deleteCustomer(@RequestBody List<Long> ids) {
        customerService.delete(ids);
    }
}
