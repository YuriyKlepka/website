package com.security.service;

import com.security.model.User;

/**
 * Created by Yuriy on 10.12.2016.
 */
public interface UserService {

    void save(User user);

    User findByUsername(String username);

    User findByEmail(String email);
}
