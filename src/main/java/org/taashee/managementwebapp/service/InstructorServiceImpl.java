package org.taashee.managementwebapp.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.taashee.managementwebapp.entity.*;
import org.taashee.managementwebapp.repository.InstructorRepository;
import org.taashee.managementwebapp.repository.RoleRepository;
import org.taashee.managementwebapp.repository.UserRepository;

import java.util.List;

@Slf4j
@Service
public class InstructorServiceImpl implements InstructorService{
    private final InstructorRepository instructorRepo;
    private final UserRepository userRepo;

    private final RoleRepository roleRepo;


    @Autowired
    public InstructorServiceImpl(InstructorRepository instructorRepo, UserRepository userRepo, RoleRepository roleRepo) {
        this.instructorRepo = instructorRepo;
        this.userRepo = userRepo;
        this.roleRepo = roleRepo;
    }


    @Override
    public Instructor addInstructor(Instructor instructor) {
        User user = new User();
        user.setUsername(instructor.getName());
        user.setPassword("$2a$10$hq4uOJRtRXsNXJbeWcC3nOWct/SCKCwVLgv6K3oX37rKJ1s1FDRX2");
        Role instructorRole = roleRepo.findByrole("INSTRUCTOR")
                .orElseThrow(() -> new RuntimeException("Role not found"));
        user.setRole(instructorRole);
        userRepo.save(user);
        instructor.setUser(user);
        return instructorRepo.save(instructor);
    }

    public Instructor updateInstructor(Instructor instructor){
        return instructorRepo.save(instructor);
    }

    @Override
    public Instructor removeInstructor(int id) {
        Instructor instructor = getInstructorById(id);
        instructorRepo.deleteById(id);
        return instructor;
    }

    @Override
    public Instructor getInstructorById(int id) {
        return instructorRepo.findById(id).get();
    }

    @Override
    public List<Instructor> getAllInstructors() {
        return instructorRepo.findAll();
    }

    @Override
    public List<Student> getAllStudents(int instructor_id){
        return instructorRepo.findStudentsInInstructorCourses(instructor_id);
    }

    @Override
    public Course getAllCourses(int instructorId) {
        return instructorRepo.findCourseByInstructorId(instructorId);
    }

    @Override
    public List<Instructor> getUnassignedInstructors() {
        return instructorRepo.findByCourseIsNull();
    }


}
