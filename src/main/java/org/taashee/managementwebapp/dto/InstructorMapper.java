package org.taashee.managementwebapp.dto;


import org.taashee.managementwebapp.entity.Instructor;

import java.util.ArrayList;
import java.util.List;

public class InstructorMapper {

        public static InstructorDTO mapInstructorToDTO(Instructor instructor) {
            InstructorDTO instructorDTO = new InstructorDTO();
            instructorDTO.setName(instructor.getName());
            instructorDTO.setDepartment(instructor.getDepartment());
            instructorDTO.setCourse(instructor.getCourse());
            return instructorDTO;
        }
    public static List<InstructorDTO> mapInstructorsToDTOs(List<Instructor> instructors) {
        List<InstructorDTO> instructorDTOs = new ArrayList<>();

        for (Instructor instructor : instructors) {
            InstructorDTO instructorDTO = mapInstructorToDTO(instructor);
            instructorDTOs.add(instructorDTO);
        }

        return instructorDTOs;
    }
}
