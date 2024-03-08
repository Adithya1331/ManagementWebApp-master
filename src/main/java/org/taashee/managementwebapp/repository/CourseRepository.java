package org.taashee.managementwebapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.taashee.managementwebapp.entity.Course;
import org.taashee.managementwebapp.entity.User;

import java.util.List;

@Repository
public interface CourseRepository extends JpaRepository<Course,Integer> {
    List<Course> findByInstructorIsNull();
}
