package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.ICustomerService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
@Transactional
public class CustomerService implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private ModelMapper modelMapper;

    @Override
    public List<CustomerSearchResponse> fillAll(CustomerSearchRequest customerSearchRequest) {
        List<CustomerEntity> customerEntities = customerRepository.findCustomers(customerSearchRequest);
        List<CustomerSearchResponse> customerSearchResponses = new ArrayList<>();

        for (CustomerEntity customerEntity : customerEntities) {
            CustomerSearchResponse response = modelMapper.map(customerEntity, CustomerSearchResponse.class);
            customerSearchResponses.add(response);
        }

        return customerSearchResponses;
    }

    @Override
    public CustomerDTO findById(Long id) {
        CustomerEntity customerEntity = customerRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Không tìm thấy khách hàng!"));

        CustomerDTO customerDTO = modelMapper.map(customerEntity, CustomerDTO.class);

        return customerDTO;
    }

    @Override
    public void save(CustomerDTO customerDTO) {
        CustomerEntity customerEntity;

        if (customerDTO.getId() != null) {
            customerEntity = customerRepository.findById(customerDTO.getId())
                    .orElseThrow(() -> new RuntimeException("Không tìm thấy khách hàng!"));

            customerEntity.setFullName(customerDTO.getFullName());
            customerEntity.setPhone(customerDTO.getPhone());
            customerEntity.setEmail(customerDTO.getEmail());
            customerEntity.setCompanyName(customerDTO.getCompanyName());
            customerEntity.setDemand(customerDTO.getDemand());
            customerEntity.setStatus(customerDTO.getStatus());
        } else {
            customerEntity = modelMapper.map(customerDTO, CustomerEntity.class);
            customerEntity.setIsActive(1L);
        }

        customerRepository.save(customerEntity);
    }


    @Override
    public void delete(List<Long> ids) {
        for (Long id : ids) {
            customerRepository.deleteById(id);
        }
    }

    @Override
    public ResponseDTO listStaffs(Long customerId) {
        CustomerEntity customerEntity = customerRepository.findById(customerId).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1, "STAFF");
        List<UserEntity> staffAssignment = customerEntity.getStaffList();
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        ResponseDTO responseDTO = new ResponseDTO();
        for(UserEntity item : staffs) {
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setFullName(item.getFullName());
            staffResponseDTO.setStaffId(item.getId());
            if (staffAssignment.contains(item)) {
                staffResponseDTO.setChecked("checked");
            } else {
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        responseDTO.setData(staffResponseDTOS);
        responseDTO.setMessage("success");
        return responseDTO;
    }

    @Override
    @Transactional
    public void updateAssignmentCustomer(AssignmentCustomerDTO assignmentCustomerDTO) {
        CustomerEntity customer = customerRepository.findById(assignmentCustomerDTO.getCustomerId())
                .orElseThrow(() -> new RuntimeException("Không tìm thấy khách hàng!"));

        List<UserEntity> staffs = userRepository.findByIdIn(assignmentCustomerDTO.getStaffs());

        customer.setStaffList(staffs);
        customerRepository.save(customer);
    }
}
