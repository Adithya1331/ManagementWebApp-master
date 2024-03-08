package org.taashee.managementwebapp.service;

import org.taashee.managementwebapp.entity.User;

public interface UserService {
    User getUserById(int id);
    int getInstructorIdByUserId(int userId);
    int getStudentIdByUserId(int userId);
    int getCurrentUserId();
}
