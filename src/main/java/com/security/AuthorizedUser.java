package com.security;


import com.security.model.User;
import com.security.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

/**
 * Created by Yuriy on 19.01.2017.
 */

public class AuthorizedUser {

    @Autowired
    private UserService userService;

    public User getUserByUsername() throws UsernameNotFoundException {

        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        User user = userService.findByUsername(auth.getName());

        return user;
    }
}
