package com.javaweb.service;

import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;

import java.util.List;

public interface ICustomerService {
    List<CustomerSearchResponse> fillAll(CustomerSearchRequest customerSearchRequest);
    void delete(List<Long> ids);
}
