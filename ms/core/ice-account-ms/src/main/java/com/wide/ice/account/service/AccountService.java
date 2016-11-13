package com.wide.ice.account.service;

import com.wide.ice.account.domain.Account;
import com.wide.ice.account.domain.User;

/**
 * Created by OELABED on 13/11/2016.
 */
public interface AccountService {

    /**
     * Finds account by given name
     *
     * @param accountName
     * @return found account
     */
    Account findByName(String accountName);

    /**
     * Checks if account with the same name already exists
     * Invokes Auth Service user creation
     * Creates new account with default parameters
     *
     * @param user
     * @return created account
     */
    Account create(User user);

    /**
     * Validates and applies incoming account updates
     * Invokes Statistics Service update
     *
     * @param name
     * @param update
     */
    void saveChanges(String name, Account update);
}
