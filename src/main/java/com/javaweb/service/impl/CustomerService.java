package com.javaweb.service.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.service.ICustomerService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class CustomerService implements ICustomerService {

    @Autowired
    private CustomerRepository customerRepository;
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
    public void delete(List<Long> ids) {
        for (Long id : ids) {
            customerRepository.deleteById(id);
        }
    }
}
