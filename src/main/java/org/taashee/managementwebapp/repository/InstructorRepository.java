package org.taashee.managementwebapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.taashee.managementwebapp.entity.Course;
import org.taashee.managementwebapp.entity.Instructor;
import org.taashee.managementwebapp.entity.Student;
import org.taashee.managementwebapp.entity.User;

import java.util.List;

@Repository
public interface InstructorRepository extends JpaRepository<Instructor,Integer> {
    List<Instructor> findByCourseIsNull();
    @Query("SELECT DISTINCT c.students FROM Course c WHERE c.instructor.id = :instructorId")
    List<Student> findStudentsInInstructorCourses(@Param("instructorId") int instructorId);

    @Query("SELECT i.course FROM Instructor i WHERE i.id = :instructorId")
    Course findCourseByInstructorId(@Param("instructorId") int instructorId);
}
