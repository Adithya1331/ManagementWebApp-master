package org.taashee.managementwebapp.service;

import org.taashee.managementwebapp.entity.Instructor;
import org.taashee.managementwebapp.entity.Student;
import  org.taashee.managementwebapp.entity.Course;
import java.util.List;

public interface InstructorService {
    Instructor addInstructor(Instructor instructor);
    Instructor removeInstructor(int id);
    Instructor getInstructorById(int id);
    List<Instructor> getAllInstructors();
    List<Student> getAllStudents(int instructorId);
    Course getAllCourses(int instructorId);
    List<Instructor> getUnassignedInstructors();
    Instructor updateInstructor(Instructor instructor);
}
