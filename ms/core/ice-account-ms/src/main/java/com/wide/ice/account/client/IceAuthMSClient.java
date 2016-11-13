package com.wide.ice.account.client;

import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wide.ice.account.domain.User;

/**
 * Created by OELABED on 13/11/2016.
 */
@FeignClient(name = "ice-account-ms")
public interface IceAuthMSClient {

    @RequestMapping(method = RequestMethod.POST, value = "/uaa/users", consumes = MediaType.APPLICATION_JSON_UTF8_VALUE)
    void createUser(User user);
}
