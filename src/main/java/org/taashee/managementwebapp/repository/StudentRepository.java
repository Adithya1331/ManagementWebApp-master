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
import java.util.Set;

@Repository
public interface StudentRepository extends JpaRepository<Student, Integer> {
    @Query("SELECT DISTINCT c.instructor FROM Student s JOIN s.courses c WHERE s.id = :studentId")
    List<Instructor> findInstructorsByStudentId(@Param("studentId") int studentId);

    @Query("SELECT s.courses FROM Student s WHERE s.id = :studentId")
    List<Course> findCoursesByStudentId(@Param("studentId") int studentId);
}
