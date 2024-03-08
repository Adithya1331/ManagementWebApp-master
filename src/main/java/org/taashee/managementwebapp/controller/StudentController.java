package org.taashee.managementwebapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.taashee.managementwebapp.dto.InstructorDTO;
import org.taashee.managementwebapp.dto.InstructorMapper;
import org.taashee.managementwebapp.entity.Instructor;
import org.taashee.managementwebapp.service.StudentService;
import org.taashee.managementwebapp.service.UserService;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentController {
    private final StudentService studentService;

    private final UserService userService;

    @Autowired
    public StudentController(StudentService studentService,UserService userService) {
        this.studentService = studentService;
        this.userService = userService;
    }

    @GetMapping("/dashboard")
    public String getDashboard(){
        return "dashboard";
    }


    @GetMapping("/studentInstructors")
    public String getStudentInstructors(Model model){
        int studentId = userService.getStudentIdByUserId(userService.getCurrentUserId());
        List<Instructor> instructors = studentService.findStudentInstructors(studentId);
        List<InstructorDTO> instructorDTOs = InstructorMapper.mapInstructorsToDTOs(instructors);
        model.addAttribute("instructors",instructorDTOs);
        return "studentInstructors-list";
    }

    @GetMapping("/studentCourses")
    public String getStudentCourses(Model model){
        int studentId = userService.getStudentIdByUserId(userService.getCurrentUserId());
        model.addAttribute("courses", studentService.findStudentCourses(studentId));
        return "courses-list";
    }

}
