package org.taashee.managementwebapp.service;

import org.springframework.stereotype.Service;
import org.taashee.managementwebapp.entity.Instructor;
import org.taashee.managementwebapp.entity.Student;
import org.taashee.managementwebapp.entity.Course;

import java.util.List;

public interface StudentService {
    Student addStudent(Student student);
    Student removeStudent(int id);
    Student getStudentById(int id);
    List<Student> getAllStudents();
    List<Instructor> findStudentInstructors(int studentId);
    List<Course> findStudentCourses(int studentId);
    Student updateStudent(Student student);

}
