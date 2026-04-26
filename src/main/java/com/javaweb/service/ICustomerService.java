package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;

import java.util.List;

public interface ICustomerService {
    List<CustomerSearchResponse> fillAll(CustomerSearchRequest customerSearchRequest);
    CustomerDTO findById(Long id);
    void save(CustomerDTO customerDTO);
    void delete(List<Long> ids);
    ResponseDTO listStaffs(Long customerId);
    void updateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO);
}
