package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.enums.Status;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.ICustomerService;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller(value="customerController")
public class CustomerController {
    @Autowired
    private IUserService userService;
    @Autowired
    private ICustomerService customerService;


    @GetMapping(value = "/admin/customer-list")
    public ModelAndView getNews(@ModelAttribute(SystemConstant.MODEL) CustomerSearchRequest customerSearchRequest, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/list");
        mav.addObject("modelSearch", customerSearchRequest);
        mav.addObject("listStaffs", userService.getStaffs());

        if (SecurityUtils.getAuthorities().contains("ROLE_STAFF")) {
            Long staffId = SecurityUtils.getPrincipal().getId();
            customerSearchRequest.setStaffId(staffId);
        }

        List<CustomerSearchResponse> listCustomers = customerService.fillAll(customerSearchRequest);

        customerSearchRequest.setListResult(listCustomers);

        customerSearchRequest.setTotalItems(listCustomers.size());
        DisplayTagUtils.of(request, customerSearchRequest);

        return mav;
    }

    @GetMapping(value = "/admin/customer-edit")
    public ModelAndView customerEdit(@ModelAttribute("customerEdit") CustomerDTO customerDTO) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("customerEdit", customerDTO);
        mav.addObject("listStatus", Status.listStatus());
        return mav;
    }
    @GetMapping(value = "/admin/customer-edit-{id}")
    public ModelAndView customerEdit(@PathVariable("id") Long Id) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");

        CustomerDTO customerDTO = customerService.findById(Id);

        mav.addObject("customerEdit", customerDTO);
        mav.addObject("listStatus", Status.listStatus());
        mav.addObject("transactionType", TransactionType.transactionType());
        //2 cai thanh sách giấu đích theo loại gian dic findByCodeAndcustomerid
        //ListType1: CSKH
        //ListType2: DDX
        return mav;
    }
}
