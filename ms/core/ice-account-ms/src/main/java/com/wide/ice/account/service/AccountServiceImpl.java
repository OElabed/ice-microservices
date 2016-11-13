package com.wide.ice.account.service;

import org.springframework.stereotype.Service;

import com.wide.ice.account.domain.Account;
import com.wide.ice.account.domain.User;

import lombok.extern.slf4j.Slf4j;

/**
 * Created by OELABED on 13/11/2016.
 */

@Slf4j
@Service
public class AccountServiceImpl implements AccountService {

    @Override
    public Account findByName(String accountName) {
        return null;
    }

    @Override
    public Account create(User user) {
        return null;
    }

    @Override
    public void saveChanges(String name, Account update) {

    }
}
