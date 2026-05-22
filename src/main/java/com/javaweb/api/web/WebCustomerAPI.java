package com.javaweb.api.web;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.service.IEmailService;
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

    @Autowired
    private IEmailService emailService;

    @PostMapping
    public void contact(@RequestBody CustomerDTO customerDTO) {
        customerDTO.setStatus("Chưa xử lý");
        customerService.save(customerDTO);

        if (customerDTO.getEmail() != null && !customerDTO.getEmail().trim().isEmpty()) {
            String subject = "Cảm ơn bạn đã liên hệ SkyLand";
            String text = "Xin chào " + customerDTO.getFullName() + ",\n\n"
                    + "Chúng tôi đã nhận được thông tin liên hệ của bạn và sẽ phản hồi sớm nhất có thể.\n\n"
                    + "Nội dung yêu cầu: " + customerDTO.getDemand() + "\n\n"
                    + "Trân trọng,\nĐội ngũ chăm sóc khách hàng SkyLand";
            
            // Send email asynchronously or catch exception in service to prevent transaction rollback
            emailService.sendSimpleMessage(customerDTO.getEmail(), subject, text);
        }
    }
}
