package org.taashee.managementwebapp.dto;

import org.taashee.managementwebapp.entity.Course;

public class InstructorDTO {
    private String name;
    private String department;
    private Course course;

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }


    public InstructorDTO() {

    }

    public InstructorDTO(String name, String department,Course course) {
        this.name = name;
        this.department = department;
        this.course = course;

    }



    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }
}
