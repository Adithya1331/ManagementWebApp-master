package org.taashee.managementwebapp.dto;


import org.taashee.managementwebapp.entity.Instructor;
import org.taashee.managementwebapp.entity.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentMapper {

        public static StudentDTO mapStudentToDTO(Student student) {
            StudentDTO studentDTO = new StudentDTO();
            studentDTO.setName(student.getName());
            studentDTO.setCourses(student.getCourses());
            studentDTO.setDateOfBirth(student.getDateOfBirth());
            studentDTO.setGender(student.getGender());
            studentDTO.setEmail(student.getEmail());
            return studentDTO;
        }
    public static List<StudentDTO> mapStudentsToDTOs(List<Student> students) {
        List<StudentDTO> studentDTOs = new ArrayList<>();
        for (Student student : students) {
            StudentDTO studentDTO = mapStudentToDTO(student);
            studentDTOs.add(studentDTO);
        }
        return studentDTOs;
    }
}
