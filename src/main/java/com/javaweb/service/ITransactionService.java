package com.javaweb.service;

import com.javaweb.model.dto.TransactionDTO;

import java.util.List;

public interface ITransactionService {
    List<TransactionDTO> findTransactions(String code, Long customerId);
    void save(TransactionDTO transactionDTO);
}
