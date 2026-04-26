package com.javaweb.api.web;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.service.impl.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value="api/customer")
public class WebCustomerAPI {
    @Autowired
    private CustomerService customerService;

    @PostMapping
    public void contact(@RequestBody CustomerDTO customerDTO) {
        customerDTO.setStatus("Chưa xử lý");
        customerService.save(customerDTO);
    }
}
