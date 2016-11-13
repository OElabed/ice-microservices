package com.wide.ice.account.domain;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

/**
 * Created by OELABED on 13/11/2016.
 */
public class User {

    @NotNull
    @Length(min = 3, max = 20)
    private String username;

    @NotNull
    @Length(min = 6, max = 40)
    private String password;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
