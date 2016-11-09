package com.wide.ice.auth.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.authentication.configurers.GlobalAuthenticationConfigurerAdapter;

/**
 * Created by OELABED on 09/11/2016.
 */
@Configuration
@Order(Ordered.LOWEST_PRECEDENCE - 20)
public class AuthenticationManagerConfiguration extends GlobalAuthenticationConfigurerAdapter {

    @Autowired
    private DataSource dataSource;

    /**
     * Setup 2 users with different roles
     */
    @Override
    public void init(AuthenticationManagerBuilder auth) throws Exception {
        // @formatter:off
        auth.jdbcAuthentication().dataSource(dataSource).withUser("dave")
                .password("secret").roles("USER");
        auth.jdbcAuthentication().dataSource(dataSource).withUser("anil")
                .password("password").roles("ADMIN");
        // @formatter:on
    }
}
