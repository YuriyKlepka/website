package com.security.service;

/**
 * Created by Yuriy on 10.12.2016.
 */
public interface SecurityService {

    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
