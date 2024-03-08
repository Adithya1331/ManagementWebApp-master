package org.taashee.managementwebapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.taashee.managementwebapp.dto.StudentDTO;
import org.taashee.managementwebapp.dto.StudentMapper;
import org.taashee.managementwebapp.entity.Course;
import org.taashee.managementwebapp.entity.Student;
import org.taashee.managementwebapp.service.CourseService;
import org.taashee.managementwebapp.service.InstructorService;
import org.taashee.managementwebapp.service.StudentService;
import org.taashee.managementwebapp.service.UserService;

import java.util.ArrayList;
import java.util.List;


@Controller
@RequestMapping("/instructor")
public class InstructorController {
    private final InstructorService instructorService;
    private final CourseService courseService;

    private final StudentService studentService;
    private final UserService userService;

    @Autowired
    public InstructorController(InstructorService instructorService, CourseService courseService, StudentService studentService, UserService userService) {
        this.instructorService = instructorService;
        this.courseService = courseService;
        this.studentService = studentService;
        this.userService = userService;
    }


    @GetMapping("/dashboard")
    public String getDashboard() {
        return "dashboard";
    }

    @GetMapping("/instructorCourse")
    public String getCourse(Model model) {
        int instructorId = userService.getInstructorIdByUserId(userService.getCurrentUserId());
        model.addAttribute("InstructorCourse", instructorService.getAllCourses(instructorId));
        return "instructorCourse";
    }


    @GetMapping("/instructorCourseStudents")
    public String getStudentsOfCourse(Model model) {
        int instructorId = userService.getInstructorIdByUserId(userService.getCurrentUserId());
        List<Student> students = instructorService.getAllStudents(instructorId);
        List<StudentDTO> studentDTOS = StudentMapper.mapStudentsToDTOs(students);
        model.addAttribute("students", studentDTOS);
        return "InstructorCourseStudents-list";
    }

    @GetMapping("/assignCourseToStudentForm")
    public String getAssignCourseStudentForm(Model model) {
        int instructorId = userService.getInstructorIdByUserId(userService.getCurrentUserId());
        Course course = instructorService.getAllCourses(instructorId);
        List<Student> allStudents = studentService.getAllStudents();
        List<Student> studentsInCourse = instructorService.getAllStudents(instructorId);
        List<Student> studentsNotInCourse = new ArrayList<>(allStudents);
        studentsNotInCourse.removeAll(studentsInCourse);
        model.addAttribute("course", course);
        model.addAttribute("studentsNotInCourse", studentsNotInCourse);
        return "assignCourseToStudent-form";
    }

    @PostMapping("/assignStudentCourse")
    public String assignStudentCourse(
            @RequestParam String courseId,
            @RequestParam String studentId,
            Model model
    ) {

        Student student = studentService.getStudentById(Integer.parseInt(studentId));
        Course course = courseService.getCourseById(Integer.parseInt(courseId));

        if (!student.getCourses().contains(course)) {
            student.getCourses().add(course);
            studentService.updateStudent(student);
        }

        return getStudentsOfCourse(model);
    }
}
