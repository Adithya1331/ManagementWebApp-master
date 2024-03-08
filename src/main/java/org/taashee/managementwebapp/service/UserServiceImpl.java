package org.taashee.managementwebapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.taashee.managementwebapp.entity.User;
import org.taashee.managementwebapp.repository.InstructorRepository;
import org.taashee.managementwebapp.repository.StudentRepository;
import org.taashee.managementwebapp.repository.UserRepository;
@Service
public class UserServiceImpl implements UserService{

    private final UserRepository userRepository;
    private final InstructorRepository instructorRepository;
    private final StudentRepository studentRepository;

    private final UserRepository userRepo;
    @Autowired
    public UserServiceImpl(UserRepository userRepository, InstructorRepository instructorRepository, StudentRepository studentRepository, UserRepository userRepo) {
        this.userRepository = userRepository;
        this.instructorRepository = instructorRepository;
        this.studentRepository = studentRepository;
        this.userRepo = userRepo;
    }


    @Override
    public User getUserById(int id) {
        return userRepo.getById(id);
    }


    @Override
    public int getInstructorIdByUserId(int userId) {
        User user = userRepository.findById(userId).orElse(null);
        if (user != null && user.getInstructor() != null) {
            return user.getInstructor().getId();
        }
        else{
        return 0;
    }
    }

    @Override
    public int getStudentIdByUserId(int userId) {
        User user = userRepository.findById(userId).orElse(null);
        if (user != null && user.getStudent() != null) {
            return user.getStudent().getId();
        } else {
            return 0;
        }
    }
    @Override
    public int getCurrentUserId() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null && authentication.getPrincipal() instanceof User) {
            User user = (User) authentication.getPrincipal();
            return user.getId();

        }
        else {
            return 0;
        }
    }

}

