/*
 * The MIT License
 *
 * Copyright (c) 2016. OELABED
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package com.wide.ice.account.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.wide.ice.account.client.IceAuthMSClient;
import com.wide.ice.account.domain.Account;
import com.wide.ice.account.domain.User;
import com.wide.ice.account.repository.AccountRepository;

import lombok.extern.slf4j.Slf4j;

/**
 * Created by OELABED on 13/11/2016.
 */

@Slf4j
@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private IceAuthMSClient iceAuthMSClient;

    @Autowired
    private AccountRepository repository;

    @Override
    public Account findByName(String accountName) {

        Assert.hasLength(accountName);
        return repository.findByName(accountName);
    }

    @Override
    public Account create(User user) {
        Account existing = repository.findByName(user.getUsername());
        Assert.isNull(existing, "account already exists: " + user.getUsername());

        iceAuthMSClient.createUser(user);

        Account account = new Account();
        account.setName(user.getUsername());
        account.setLastSeen(new Date());

        repository.save(account);

        log.info("new account has been created: " + account.getName());

        return account;
    }

    @Override
    public void saveChanges(String name, Account update) {

        Account account = repository.findByName(name);
        Assert.notNull(account, "can't find account with name " + name);


        account.setLastSeen(new Date());
        repository.save(account);

        log.debug("account {} changes has been saved", name);
    }
}
