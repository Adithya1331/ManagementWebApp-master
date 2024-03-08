package org.taashee.managementwebapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.taashee.managementwebapp.entity.Course;
import org.taashee.managementwebapp.entity.Instructor;
import org.taashee.managementwebapp.entity.Student;
import org.taashee.managementwebapp.service.CourseService;
import org.taashee.managementwebapp.service.InstructorService;
import org.taashee.managementwebapp.service.StudentService;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {
    public final InstructorService instructorService;

    public final StudentService studentService;

    public final CourseService courseService;

    public AdminController(InstructorService instructorService, StudentService studentService, CourseService courseService) {
        this.instructorService = instructorService;
        this.studentService = studentService;
        this.courseService = courseService;
    }
    @GetMapping("/dashboard")
    public String getDashboard(){
        return "dashboard";
    }
    @GetMapping(path = "/allInstructors")
    public String getAllInstructors(Model model){
        List<Instructor> instructors = instructorService.getAllInstructors();
        model.addAttribute("instructors", instructors);
        return "instructors-list";
    }

    @GetMapping(path = "/allStudents")
    public String getAllStudents(Model model){
        List<Student> students = studentService.getAllStudents();
        model.addAttribute("students", students);
        return "students-list";
    }

    @GetMapping(path = "/allCourses")
    public String getAllCourses(Model model){
        List<Course> courses = courseService.getAllCourses();
        model.addAttribute("courses", courses);
        return "courses-list";
    }

    @GetMapping(path = "/addStudentForm")
    public String addStudentForm(){
        return "addStudent-form";
    }

    @PostMapping(path = "/addStudent")
    public String addStudent(@ModelAttribute Student student,Model model){
        studentService.addStudent(student);
        return getAllStudents(model);
    }

    @GetMapping("/addInstructorForm")
    public String addInstructorForm(){
        return "addInstructor-form";
    }

    @PostMapping("/addInstructor")
    public String addInstructor(@ModelAttribute Instructor instructor, Model model){
        instructorService.addInstructor(instructor);
        return getAllInstructors(model);
    }

    @GetMapping("/addCourseForm")
    public String addCourseForm(){
        return "addCourse-form";
    }

    @PostMapping("/addCourse")
    public String addCourse(@ModelAttribute Course course, Model model){
        courseService.addCourse(course);
        return getAllCourses(model);
    }

    @GetMapping("/assignInstructorCourseForm")
    public String getAssignInstructorCourseForm(Model model) {
        List<Course> unassignedCourses = courseService.getUnassignedCourses();
        List<Instructor> unassignedInstructors = instructorService.getUnassignedInstructors();
        model.addAttribute("unassignedCourses", unassignedCourses);
        model.addAttribute("unassignedInstructors", unassignedInstructors);
        return "assignCourse-form";
    }

    @PostMapping("/assignInstructorCourse")
    public String assignCourse(@RequestParam int instructorId, @RequestParam int courseId, Model model) {
        Instructor instructor = instructorService.getInstructorById(instructorId);
        Course course = courseService.getCourseById(courseId);
        instructor.setCourse(course);
        Instructor updatedInstructor = instructorService.updateInstructor(instructor);
        return getAllCourses(model);
    }

}
