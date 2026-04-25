package com.javaweb.controller.admin;

import com.javaweb.constant.SystemConstant;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.service.IUserService;
import com.javaweb.utils.DisplayTagUtils;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class CustomerController {
    @Autowired
    private IUserService userService;
    @GetMapping(value = "/admin/customer-list")
    public ModelAndView getNews(@ModelAttribute(SystemConstant.MODEL) CustomerDTO model, HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("admin/customer/List");
        mav.addObject("staffmaps", userService.getStaffs());
        List<CustomerDTO> list = new ArrayList<>();
        CustomerDTO customerDTO = new CustomerDTO();
        customerDTO.setId(2L);
        customerDTO.setName("Nguyen Van Hanh");
        customerDTO.setCustomerPhone("0913746245");
        customerDTO.setStatus("Dang xử lý");
        customerDTO.setPage(1);
        customerDTO.setLimit(7);
        customerDTO.setMaxPageItems(1);
        list.add(customerDTO);
        model.setListResult(list);
        DisplayTagUtils.of(request, model);
        mav.addObject("modelSearch", model);
        mav.addObject("customers", list);
        return mav;
    }

    @GetMapping(value = "/admin/customer-edit")
    public ModelAndView customerEdit(@ModelAttribute("customerEdit") CustomerDTO customerDTO) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("customerEdit", customerDTO);
        return mav;
    }
    @GetMapping(value = "/admin/customer-edit-{id}")
    public ModelAndView customerEdit(@PathVariable("id") Long Id) {
        ModelAndView mav = new ModelAndView("admin/customer/edit");

        //find customer by id
        CustomerDTO customerDTO = new CustomerDTO();
        customerDTO.setId(Id);
        customerDTO.setName("Nguyen Van Mann");
        customerDTO.setCustomerPhone("0913746245");
        customerDTO.setStatus("Dang xử lý");
        customerDTO.setPage(1);
        customerDTO.setLimit(2);
        customerDTO.setMaxPageItems(1);
        mav.addObject("transactionType", TransactionType.transactionType());
        mav.addObject("customerEdit", customerDTO);
        //2 cai thanh sách giấu đích theo loại gian dic findByCodeAndcustomerid
        //ListType1: CSKH
        //ListType2: DDX
        return mav;
    }
}
