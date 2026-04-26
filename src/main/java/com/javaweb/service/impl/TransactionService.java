package com.javaweb.service.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.service.ITransactionService;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
public class TransactionService implements ITransactionService {

    @Autowired
    private TransactionRepository transactionRepository;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public List<TransactionDTO> findTransactions(String code, Long customerId) {
        List<TransactionEntity> entities = transactionRepository.findByCodeAndCustomerId(code, customerId);
        List<TransactionDTO> dtos = new ArrayList<>();
        for(TransactionEntity entity : entities) {
            TransactionDTO dto = modelMapper.map(entity, TransactionDTO.class);
            dtos.add(dto);
        }

        return dtos;
    }

    @Override
    @Transactional
    public void save(TransactionDTO transactionDTO) {
        if (transactionDTO.getId() != null) {
            TransactionEntity transactionEntity = transactionRepository.findById(transactionDTO.getId())
                    .orElseThrow(() -> new RuntimeException("Không tìm thấy giao dịch!"));

            transactionEntity.setNote(transactionDTO.getNote());
            transactionRepository.save(transactionEntity);
        } else {
            TransactionEntity transactionEntity = new TransactionEntity();

            transactionEntity.setCode(transactionDTO.getCode());
            transactionEntity.setNote(transactionDTO.getNote());

            CustomerEntity customer = customerRepository.findById(transactionDTO.getCustomerId())
                    .orElseThrow(() -> new RuntimeException("Không tìm thấy khách hàng!"));
            transactionEntity.setCustomer(customer);

            transactionRepository.save(transactionEntity);
        }
    }
}
