package org.taashee.managementwebapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.taashee.managementwebapp.entity.Course;
import org.taashee.managementwebapp.repository.CourseRepository;

import java.util.List;

@Service
public class CourseServiceImpl implements CourseService{

    private final CourseRepository courseRepo;
    @Autowired
    public CourseServiceImpl(CourseRepository courseRepo) {
        this.courseRepo = courseRepo;
    }

    @Override
    public void addCourse(Course course) {
        courseRepo.save(course);
    }


    @Override
    public Course getCourseById(int id) {
        return courseRepo.findById(id).get();
    }

    @Override
    public List<Course> getAllCourses() {
        return courseRepo.findAll();
    }

    @Override
    public List<Course> getUnassignedCourses() {
        return courseRepo.findByInstructorIsNull();
    }
}
