package org.taashee.managementwebapp.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.taashee.managementwebapp.entity.*;
import org.taashee.managementwebapp.repository.RoleRepository;
import org.taashee.managementwebapp.repository.StudentRepository;
import org.taashee.managementwebapp.repository.UserRepository;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService{

    private final StudentRepository studentRepo;
    private final UserRepository userRepo;
    private final RoleRepository roleRepo;

    @Autowired
    public StudentServiceImpl(StudentRepository studentRepo, UserRepository userRepo, RoleRepository roleRepo) {
        this.studentRepo = studentRepo;
        this.userRepo = userRepo;
        this.roleRepo = roleRepo;
    }


    @Override
    public Student addStudent(Student student) {
        User user = new User();
        user.setUsername(student.getName());
        user.setPassword("$2a$10$hq4uOJRtRXsNXJbeWcC3nOWct/SCKCwVLgv6K3oX37rKJ1s1FDRX2");
        Role studentRole = roleRepo.findByrole("STUDENT")
                .orElseThrow(() -> new RuntimeException("Role not found"));
        user.setRole(studentRole);
        userRepo.save(user);
        student.setUser(user);
        return studentRepo.save(student);
    }

    @Override
    public Student removeStudent(int id) {
        Student student = getStudentById(id);
        studentRepo.deleteById(id);
        return student;
    }

    @Override
    public Student getStudentById(int id) {
        return studentRepo.findById(id).get();
    }

    @Override
    public List<Student> getAllStudents() {
        return studentRepo.findAll();
    }

    @Override
    public List<Instructor> findStudentInstructors(int studentId) {
        return studentRepo.findInstructorsByStudentId(studentId);
    }

    @Override
    public List<Course> findStudentCourses(int studentId) {
        return studentRepo.findCoursesByStudentId(studentId);
    }

    @Override
    public Student updateStudent(Student student) {
        return studentRepo.save(student);
    }

}
