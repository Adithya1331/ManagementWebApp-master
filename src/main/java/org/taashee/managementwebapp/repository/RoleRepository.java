package org.taashee.managementwebapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.taashee.managementwebapp.entity.Role;

import java.util.Optional;

public interface RoleRepository extends JpaRepository<Role, Long> {
    Optional<Role> findByrole(String role);
}
