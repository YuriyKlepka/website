package com.security.dao;

import com.security.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Yuriy on 10.12.2016.
 */
public interface RoleDao extends JpaRepository <Role, Long> {


}
