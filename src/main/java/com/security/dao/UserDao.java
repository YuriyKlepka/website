package com.security.dao;

import com.security.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Yuriy on 08.12.2016.
 */
public interface UserDao extends JpaRepository <User, Long> {

    User findByUsername(String username);

    User findByEmail(String email);
}
