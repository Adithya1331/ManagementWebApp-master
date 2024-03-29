package org.taashee.managementwebapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Repository;
import org.taashee.managementwebapp.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User,Integer> {
    UserDetails findByUsername(String username);
}
