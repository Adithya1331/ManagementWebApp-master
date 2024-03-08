package org.taashee.managementwebapp.service;

import org.taashee.managementwebapp.entity.Course;

import java.util.List;

public interface CourseService {
    void addCourse(Course course);
    Course getCourseById(int id);
    List<Course> getAllCourses();
    List<Course> getUnassignedCourses();

}
